//
//  LoginViewModel.swift
//  Zonezero
//
//  Created by yakup caglan on 8.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate? { get }
   
    var person: Person { get }
    
    func isRegistered(email: String, pass: String) -> Bool
}

protocol LoginViewModelDelegate: class {
    
}

final class LoginViewModel: LoginViewModelProtocol {
        
    weak var delegate: LoginViewModelDelegate?
    
    var person: Person
    
    init(person: Person) {
        self.person  = person
    }
    
 
    func isRegistered(email: String, pass: String) -> Bool {
        
        if email == person.email && pass == person.password {
            return true
        }
        
        return false
    }
}
