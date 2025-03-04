//
//  ColorCollectionViewCell.swift
//  Card
//
//  Created by Saadet Şimşek on 27/02/2025.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ColorCollectionViewCell"
    
    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "checkmark")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        image.widthAnchor.constraint(equalToConstant: 24).isActive = true
        image.heightAnchor.constraint(equalToConstant: 24).isActive = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setCell(colors: [String]) {
        let gradient = ViewManager.shared.getGradient(frame: CGRect(origin: .zero, size: CGSize(width: 62, height: 62)),colors: colors) // gradient imin frame vermeliyiz
        self.layer.addSublayer(gradient)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        
        self.addSubview(checkImage)
        
        NSLayoutConstraint.activate([
            checkImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func selectItem(){
        checkImage.isHidden = false
    }
    
    func deselectItem(){
        checkImage.isHidden = true
    }
}
