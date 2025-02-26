//
//  ViewBuilder.swift
//  Card
//
//  Created by Saadet Şimşek on 26/02/2025.
//

import UIKit

final class ViewBuilder {
    
    private let manager = ViewManager.shared
    
    var controller: UIViewController
    var view: UIView
    
    init(controller: UIViewController, view: UIView) {
        self.controller = controller
        self.view = view
    }
}
