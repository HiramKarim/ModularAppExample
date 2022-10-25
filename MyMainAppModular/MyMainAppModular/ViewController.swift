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
    
    private var viewModel: DogFactsViewModel!
    
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
    
    private func commonInit() {
        self.viewModel = makeViewModel(repository: makeRepository(),
                                       onSuccess: { [weak self] factValue in
            self?.onSuccess(factMessage: factValue)
        }, onError: { [weak self] errorMessage in
            self?.onError(errorMessage: errorMessage)
        })
    }
    
    // MARK: - Binding
      func onSuccess(factMessage: String) {
        print(Self.self, #function, factMessage)
      }
      
      func onError(errorMessage: String) {
        print(Self.self, #function, errorMessage)
      }
    
    @objc
    private func goToLogin() {
        self.loginCoordinator = LoginCoordinator(navigator: self.navigationController)
        self.loginCoordinator?.makeLoginCoordinator()
    }


}

fileprivate func makeRepository() -> DogFactsRepository {
    DogFactsRemoteRepository(
        httpClient: URLSessionHTTPClient(),
        api: .dev
      )
}

fileprivate func makeViewModel(
  repository: DogFactsRepository,
  onSuccess: @escaping (_ factValue: String) -> Void,
  onError: @escaping (_ errorMessage: String) -> Void
) -> DogFactsViewModel {
  DogFactsViewModel(
    repository: repository,
    onSuccess: onSuccess,
    onError: onError
  )
}
