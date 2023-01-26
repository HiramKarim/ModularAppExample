//
//  ViewController.swift
//  MyMainAppModular
//
//  Created by Hiram Castro on 05/10/22.
//

import UIKit
import Shared
import Feature_Login
import CoreNetwork

class ViewController: UIViewController {
    
    private let factsTextView:UITextView = {
        let textview = UITextView()
        textview.backgroundColor = .red
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    
    let fetchFactsButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("fetch", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var loginCoordinator:LoginCoordinator?
    private var viewModel: DogFactsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(factsTextView)
        self.view.addSubview(fetchFactsButton)
        
        NSLayoutConstraint.activate([
            factsTextView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            factsTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            factsTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            factsTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            fetchFactsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            fetchFactsButton.topAnchor.constraint(equalTo: factsTextView.bottomAnchor, constant: 10),
            fetchFactsButton.widthAnchor.constraint(equalToConstant: 50),
            fetchFactsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        fetchFactsButton.addTarget(self, action: #selector(fetchDogFacts), for: .touchUpInside)
        
        commonInit()
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
        
        DispatchQueue.main.async {
            self.factsTextView.text = factMessage
        }
        
      print(Self.self, #function, factMessage)
    }
    
    func onError(errorMessage: String) {
      print(Self.self, #function, errorMessage)
    }
    
    //MARK: -  Action Button
    @objc
    private func fetchDogFacts() {
        self.viewModel.onUserInput(.fetchFactClicked)
    }
    
    @objc
    private func goToLogin() {
        self.loginCoordinator = LoginCoordinator(navigator: self.navigationController)
        self.loginCoordinator?.makeLoginCoordinator()
    }

}

fileprivate func makeRepository() -> DogFactsRepository {
    return DogFactsRemoteRepository(
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
