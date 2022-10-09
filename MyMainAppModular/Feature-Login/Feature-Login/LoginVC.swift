//
//  LoginVC.swift
//  Feature-Login
//
//  Created by Hiram Castro on 08/10/22.
//

import UIKit

class LoginVC: UIViewController {
    
    let welcomeLabel:UILabel = {
       let label = UILabel()
        label.text = "Welcome to login"
        
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(welcomeLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
    }


}
