//
//  ViewManager.swift
//  Card
//
//  Created by Saadet Şimşek on 26/02/2025.
//

import UIKit

final class ViewManager {
    static let shared = ViewManager()
    
    let colors: [ [String] ] = [
        ["#16A085FF", "#003F32FF"],
        ["#9A00D1FF", "#45005DFF"],
        ["#FA6000FF", "#FAC6A6FF"],
        ["#DE0007FF", "#8A0004FF"],
        ["#2980B9FF", "#2771A1FF"],
        ["#E74C3CFF", "#93261BFF"]
    ]
    
    let images: [UIImage] = [.icon1, .icon2, .icon3, .icon4, .icon5, .icon6]
    
    init() { }
    
    
    func getGradient(frame: CGRect = CGRect(origin: .zero, size: CGSize(width: 306, height: 175)), colors: [String]) -> CAGradientLayer{
        
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{
            UIColor(hex: $0)?.cgColor ?? UIColor.white.cgColor
        }
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.locations = [0, 1]
        return gradient
    }
    
    func getCard(colors: [String], balance: Float, cardNumber: Int, cardImage: UIImage) -> UIView{
        
        let card = {
            let card = UIView()
            let gradient = self.getGradient(colors: colors)
            card.layer.insertSublayer(gradient, at: 0)
            card.clipsToBounds = true
            card.layer.cornerRadius = 30
            card.translatesAutoresizingMaskIntoConstraints = false
            card.tag = 7
            
            card.widthAnchor.constraint(equalToConstant: 306).isActive = true
            card.heightAnchor.constraint(equalToConstant: 175).isActive = true
            
            
            return card
        }()
        
        let imageView = {
            let imageView = UIImageView()
            imageView.image = cardImage
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.layer.opacity = 0.3
            imageView.clipsToBounds = true
            return imageView
        }()
        
        let balanceLabel = {
            let balanceLabel = UILabel()
            balanceLabel.text = "$\(balance)"
            balanceLabel.textColor = .white
            balanceLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            return balanceLabel
        }()
        
        let numberLabel = {
            let numberLabel = UILabel()
            numberLabel.text = "****\(cardNumber)"
            numberLabel.textColor = .white
            numberLabel.layer.opacity = 0.3
            return numberLabel
        }()
        
        let hStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(balanceLabel)
            stack.addArrangedSubview(numberLabel)
            return stack
        }()
        
        card.addSubview(imageView)
        card.addSubview(hStack)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: 30),
            
            hStack.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 30),
            hStack.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -30),
            hStack.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -30)
            
        ])
        return card
    }
    
    func colorSlideTitle(titleText: String) -> UILabel {
        let sliderTitle = UILabel()
        sliderTitle.text = titleText
        sliderTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        sliderTitle.textColor = .white
        sliderTitle.translatesAutoresizingMaskIntoConstraints = false
        return sliderTitle
    }
    
    
    func getCollection(id: String, dataSource: UICollectionViewDataSource, delagate: UICollectionViewDelegate) -> UICollectionView{
        let collection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 62, height: 62)
            layout.minimumLineSpacing = 15
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0,
                                               left: 30,
                                               bottom: 0,
                                               right: 30)
            
            let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            colletionView.restorationIdentifier = id // Uygulama kapanıp açıldığında veya arka plana atılıp geri döndüğünde, ekranın kaldığı yerden aynı durumda yüklenmesini sağlamak için kullanılır.
            colletionView.delegate = delagate
            colletionView.dataSource = dataSource
            colletionView.translatesAutoresizingMaskIntoConstraints = false
            colletionView.backgroundColor = .clear
            colletionView.showsHorizontalScrollIndicator = false
            colletionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
            return colletionView
        }()
        return collection
    }
    
}
