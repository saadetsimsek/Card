//
//  ColorCollectionViewCell.swift
//  Card
//
//  Created by Saadet Şimşek on 27/02/2025.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ColorCollectionViewCell"
    
    func setCell(colors: [String]) {
        let gradient = ViewManager.shared.getGradient(colors: colors)
        self.layer.addSublayer(gradient)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
}
