//
//  RegisterViewController.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

final class RegisterViewController: LayoutableViewController {
    
    typealias ViewType = RegisterView
    
    var viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
           super.viewDidLoad()
           view = ViewType.create()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Register"
        
        layoutableView.delegate = self
        
    }
}

extension RegisterViewController: RegisterViewDelegate, Alertable {

    func registerButtonDidTap() {
        let ly = layoutableView
        let container = DependencyContainer()
        let allTextField = [ly.nameTextField, ly.nameTextField, ly.passwordTextField, ly.rePasswordTextFieldd]
        
        let isEmpty = viewModel.isEmpty(allTextField)
        let okayAction = UIAlertAction(title: "Okay", style: .default)
        
        let person = Person(name: ly.nameTextField.text!, email: ly.emailTextField.text!, password: ly.passwordTextField.text!, password2: ly.rePasswordTextFieldd.text!)
        
        if isEmpty {
            
            self.showAlert(title: "WARNING", message: "All fields are required", alertActions: okayAction)
        
        } else {
            
            if !viewModel.isTheLeastCharacterCountEnough(pass: person.password!, pass2: person.password2!) {
               
                self.showAlert(title: "WARNING", message: "Password length must be greater than 3", alertActions: okayAction)

            } else {
                if !viewModel.areThePasswordEqual(pass: person.password!, pass2: person.password2!) {

                self.showAlert(title: "WARNING", message: "Passwords do not match", alertActions: okayAction)
                    
                } else {
            
                    let loginViewController = container.makeLoginViewController(person: person)
                    navigationController?.pushViewController(loginViewController, animated: true)
            
                }
            }
        }
    }
}
