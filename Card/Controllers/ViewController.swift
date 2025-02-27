//
//  ViewController.swift
//  Card
//
//  Created by Saadet Şimşek on 25/02/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var builder = {
        return ViewBuilder(controller: self, view: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#141414FF")
        
        builder.setPageTitle(title: "Desing your virtual card")
        builder.getCard()
        builder.getColorCollection()
        
    }


}

