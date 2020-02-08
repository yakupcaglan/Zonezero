//
//  LoginViewController.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

class LoginViewController: LayoutableViewController {
    
    typealias ViewType = LoginView
    
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func loadView() {
        super.loadView()
        
        view = ViewType.create()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        layoutableView.emailTextField.text = ""
        layoutableView.passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutableView.delegate = self
    }
}


extension LoginViewController: LoginViewDelegate, Alertable {
    func loginButtonDidTap() {
        
        guard let email = layoutableView.emailTextField.text, let pass = layoutableView.passwordTextField.text else  { return }
        
        if !viewModel.isRegistered(email: email, pass: pass) {
        
            let okayAction = UIAlertAction(title: "Okay", style: .destructive)
            self.showAlert(title: "WARNING", message: "Wrong password or e-mail", alertActions: okayAction )
        
        } else {
            
            let container = DependencyContainer()
            let movieListController = container.makeMovieListController()
            
            navigationController?.pushViewController(movieListController, animated: true)
        }
        
    }
}

