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
    
}
