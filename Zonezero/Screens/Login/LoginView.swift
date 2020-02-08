//
//  LoginView.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit
import SnapKit


protocol LoginViewDelegate: class {
    func loginButtonDidTap()
}

class LoginView: LayoutableView {
    
    weak var delegate: LoginViewDelegate?
    
    private (set) lazy var emailTextField = TextField(placaholder: "E-Mail")
    
    private (set) lazy var passwordTextField = TextField(placaholder: "Paswword", isSecureTextEntry: true)
    
    private (set) lazy var promotionCheckboxView = CheckboxView()
    
    private (set) lazy var remindMeCheckboxView = CheckboxView()
    
    private lazy var remindMeLabel = CustomLabel(text: "Remind me")
    
    private lazy var promotionLabel = CustomLabel(text: "I accept to get promotional e-mail from Mobillium about ZonZero Program")

    private lazy var stackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
           stackView.axis = .vertical
           stackView.spacing = 12
           stackView.distribution = .fillProportionally
           
           return stackView
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .twitterBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        button.isEnabled = false
        return button
    }()
    
    func setupViews() {
        add(stackView, loginButton, promotionLabel, promotionCheckboxView, remindMeLabel, remindMeCheckboxView, loginButton)

        promotionCheckboxView.addTarget(self, action: #selector(promotionCheckbox), for: .valueChanged)
        remindMeCheckboxView.addTarget(self, action: #selector(promotionCheckbox), for: .valueChanged)
        
        loginButton.addTarget(self, action: #selector(loginHandle), for: .touchUpInside)
        
    }
    
    func setupLayout() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-60)
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
        }
        
        remindMeCheckboxView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(24)
            $0.leading.equalTo(stackView.snp.leading).offset(4)
        }
        
        remindMeLabel.snp.makeConstraints {
            $0.centerY.equalTo(remindMeCheckboxView.snp.centerY)
            $0.leading.equalTo(remindMeCheckboxView.snp.trailing).offset(8)
        }
        
        promotionCheckboxView.snp.makeConstraints {
            $0.top.equalTo(remindMeCheckboxView.snp.bottom).offset(4)
            $0.leading.equalTo(remindMeCheckboxView.snp.leading)
            $0.trailing.equalTo(remindMeCheckboxView.snp.trailing)
        }
        
        promotionLabel.snp.makeConstraints {
            $0.top.equalTo(promotionCheckboxView.snp.top)
            $0.trailing.equalTo(stackView.snp.trailing).offset(-8)
            $0.leading.equalTo(promotionCheckboxView.snp.trailing).offset(8)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(promotionLabel.snp.bottom).offset(40)
            $0.leading.equalTo(stackView.snp.leading)
            $0.trailing.equalTo(stackView.snp.trailing)
            $0.height.equalTo(48)
        }
    
    }
    
    @objc func loginHandle() {
        delegate?.loginButtonDidTap()
    }
    
    @objc func promotionCheckbox(sender: CheckboxView) {
        UIView.animate(withDuration: 0.4, animations: {
            self.loginButton.isEnabled = sender.selectionState == .normal
         })
    }
    
    @objc func methodremindMeCheckbox(sender: CheckboxView) {
    
    }
}
