//
//  RegisterView.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit
import SnapKit

protocol RegisterViewDelegate: class {
    func registerButtonDidTap()
}

final class RegisterView: LayoutableView {
    
    weak var delegate: RegisterViewDelegate?
    
    private (set) lazy var nameTextField = TextField(placaholder: "Name")
    
    private (set) lazy var emailTextField = TextField(placaholder: "E-Mail", keyboardType: .emailAddress)
     
    private (set) lazy var passwordTextField = TextField(placaholder: "Password" , isSecureTextEntry: true)
    
    private (set) lazy var rePasswordTextFieldd = TextField(placaholder: "Repeat password", isSecureTextEntry: true)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, passwordTextField ,rePasswordTextFieldd, emailTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private (set) lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .twitterBlue
        button.setTitle("Register", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 6
        return button
    }()
    
    func setupViews() {
        
        add(stackView, registerButton)
        
        registerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    
    func setupLayout() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(80)
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
            $0.height.equalToSuperview().multipliedBy(0.27)
        }
        
        registerButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-60)
            $0.height.equalTo(48)
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
        }
    }
    
    @objc private func buttonTapped() {
        delegate?.registerButtonDidTap()
    }
    
}

