//
//  ViewController.swift
//  MyMainAppModular
//
//  Created by Hiram Castro on 05/10/22.
//

import UIKit
import Shared
import Feature_Login

class ViewController: UIViewController {
    
    let loginButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Go to login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var loginCoordinator:LoginCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        loginButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc
    private func goToLogin() {
        self.loginCoordinator = LoginCoordinator(navigator: self.navigationController)
        self.loginCoordinator?.makeLoginCoordinator()
    }


}

