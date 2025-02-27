//
//  ViewBuilder.swift
//  Card
//
//  Created by Saadet Şimşek on 26/02/2025.
//

import UIKit

final class ViewBuilder {
    
    private let manager = ViewManager.shared
    private var card = UIView()
    
    var controller: UIViewController
    var view: UIView
    
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
        card = manager.getCard(colors: <#T##[String]#>, balance: <#T##Float#>, cardNumber: <#T##Int#>, cardImage: <#T##UIImage#>)
    }

}
