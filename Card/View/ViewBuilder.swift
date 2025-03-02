//
//  ViewBuilder.swift
//  Card
//
//  Created by Saadet Şimşek on 26/02/2025.
//

import UIKit

enum RestoreIDs: String {
    case colors, image
}

final class ViewBuilder: NSObject {
    
    private let manager = ViewManager.shared
    private var card = UIView()
    private let balance: Float = 9.999
    private let cardNumber: Int = 1234
    
    private var colorCollection: UICollectionView!
    private var imageCollection: UICollectionView!
    
    var controller: UIViewController
    var view: UIView
    
    var cardColor: [String] = ["#16A085FF", "#003F32FF"] { // card change select color
        willSet{
            //
            if let colorView = view.viewWithTag(7) { // viewde tag değeri 7 olan alt görünümü arıyor
                colorView.layer.sublayers?.remove(at: 0) // eski gradient kaldırılıyor
                let gradient = manager.getGradient(colors: newValue)
                colorView.layer.insertSublayer(gradient, at: 0)
              //  colorView.layer.addSublayer(gradient) // bunu dediğinde sadece renk değişir cardın üstündeki label ve imageler kaybolur
            }
        }
    }
    
    var cardIcon: UIImage = .icon5 {
        willSet{
            if let imageView = card.viewWithTag(8) as? UIImageView {
                imageView.image = newValue
            }
        }
    }
    
    init(controller: UIViewController, view: UIView) {
        self.controller = controller
        self.view = view
    }
    
    private lazy var pageTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    func setPageTitle(title: String) {
        pageTitle.text = title
        view.addSubview(pageTitle)
        
        NSLayoutConstraint.activate([
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
        ])
    }

    func getCard(){
        card = manager.getCard(colors: cardColor,
                               balance: balance,
                               cardNumber: cardNumber,
                               cardImage: cardIcon)
        view.addSubview(card)
        
        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 30)
        ])
    }
    
    func getColorCollection(){
        
        let colorTitle = manager.colorSlideTitle(titleText: "Select color")
        
        colorCollection = manager.getCollection(id: RestoreIDs.colors.rawValue,
                                                dataSource: self,
                                                delagate: self)
        colorCollection.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
        colorCollection.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: IconCollectionViewCell.identifier)
        
        view.addSubview(colorTitle)
        view.addSubview(colorCollection)
        
        NSLayoutConstraint.activate([
            colorTitle.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 40),
            colorTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            colorTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            colorCollection.topAnchor.constraint(equalTo: colorTitle.bottomAnchor, constant: 20),
            colorCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setIconCollection(){
        let iconCollectionTitle = manager.colorSlideTitle(titleText: "Add shapes")
        imageCollection = manager.getCollection(id: RestoreIDs.image.rawValue,
                                                dataSource: self,
                                                delagate: self)
        imageCollection.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: IconCollectionViewCell.identifier)
        
        view.addSubview(iconCollectionTitle)
        view.addSubview(imageCollection)
        
        NSLayoutConstraint.activate([
            iconCollectionTitle.topAnchor.constraint(equalTo: colorCollection.bottomAnchor, constant: 40),
            iconCollectionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            iconCollectionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            imageCollection.topAnchor.constraint(equalTo: iconCollectionTitle.bottomAnchor, constant: 20),
            imageCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
//MARK: - Collectionview

extension ViewBuilder: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       switch collectionView.restorationIdentifier{
       case RestoreIDs.colors.rawValue:
            return manager.colors.count
       case RestoreIDs.image.rawValue:
            return manager.images.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    /*    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath)
        return cell
     */
        switch collectionView.restorationIdentifier {
        case RestoreIDs.colors.rawValue:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as? ColorCollectionViewCell {
                let colore =  manager.colors[indexPath.item]
                cell.setCell(colors: colore)
                return cell
            }
            
        case RestoreIDs.image.rawValue:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCollectionViewCell.identifier, for: indexPath) as? IconCollectionViewCell {
                let icon = manager.images[indexPath.item]
                cell.setIcon(icon: icon)
                return cell
            }

        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.restorationIdentifier {
        case RestoreIDs.colors.rawValue:
            let colors = manager.colors[indexPath.item]
            self.cardColor = colors
            
            let cell =  collectionView.cellForItem(at: indexPath) as? ColorCollectionViewCell
            cell?.selectItem()
            
        case RestoreIDs.image.rawValue:
            let image = manager.images[indexPath.item]
            self.cardIcon = image
            
        default:
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        switch collectionView.restorationIdentifier {
        case RestoreIDs.colors.rawValue:
            let cell = collectionView.cellForItem(at: indexPath) as? ColorCollectionViewCell
            cell?.deselectItem()
            
        default:
            return
        }
    }

}


