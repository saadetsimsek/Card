//
//  IconCollectionViewCell.swift
//  Card
//
//  Created by Saadet Şimşek on 27/02/2025.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "IconCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 44).isActive = true
        image.heightAnchor.constraint(equalToConstant: 44).isActive = true
        image.layer.opacity = 0.2
        return image
    }()
    
    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "checkmark")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        image.widthAnchor.constraint(equalToConstant: 24).isActive = true
        image.heightAnchor.constraint(equalToConstant: 24).isActive = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setIcon(icon: UIImage){
        imageView.image = icon
        self.addSubview(imageView)
        self.addSubview(checkImage)
        self.backgroundColor = UIColor(hex: "#E0E0E0FF")
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            
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
