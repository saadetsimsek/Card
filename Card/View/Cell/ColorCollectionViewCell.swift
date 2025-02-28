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
        let gradient = ViewManager.shared.getGradient(frame: CGRect(origin: .zero, size: CGSize(width: 62, height: 62)),colors: colors) // gradient imin frame vermeliyiz
        self.layer.addSublayer(gradient)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
}
