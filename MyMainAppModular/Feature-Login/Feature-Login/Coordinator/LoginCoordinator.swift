//
//  LoginCoordinator.swift
//  Feature-Login
//
//  Created by Hiram Castro on 08/10/22.
//

import Foundation
import UIKit


protocol Coordinating {
    func makeLoginCoordinator()
}

public class LoginCoordinator:Coordinating {
    
    private weak var naviagtor: UINavigationController?
    
    public init(navigator: UINavigationController?) {
        self.naviagtor = navigator
    }
    
    public func makeLoginCoordinator() {
        self.naviagtor?.pushViewController(LoginVC(), animated: true)
    }
    
}
