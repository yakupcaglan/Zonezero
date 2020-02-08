//
//  RegisterViewModel.swift
//  Zonezero
//
//  Created by yakup caglan on 7.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

protocol RegisterViewModelProtocol: class {
    var delegate: RegisterViewModelDelegate? { get }
    
    var person: Person { get }
    
    var esitmi: Bool { get }
    
    var buyukmu: Bool { get }
    
    func areThePasswordEqual(pass: String, pass2: String) -> Bool
    
    func isTheLeastCharacterCountEnough(pass: String, pass2: String) ->  Bool
    
    func isEmpty(_ textFields: [UITextField]) -> Bool
    

    
}

protocol RegisterViewModelDelegate: class {
    
}


class RegisterViewModel: RegisterViewModelProtocol {
   

    weak var delegate: RegisterViewModelDelegate?
    
    var person: Person
    
    
    init(person: Person) {
        self.person = person
    }
    
    func isEmpty(_ textFields: [UITextField]) -> Bool {
          return textFields.allSatisfy { $0.text!.isEmpty }
    }
    
    func areThePasswordEqual(pass: String, pass2: String) -> Bool {
        if pass == pass2 {
            return true
        }
        
        return false
    }
       
    func isTheLeastCharacterCountEnough(pass: String, pass2: String) -> Bool {
        if pass.count > 3 && pass2.count > 3 {
            return true
        }
        return false
    }
    
    //TODO:- sil
    var esitmi: Bool {
        guard let pass = person.password, let pass2 = person.password2 else { return false }

        if pass == pass2 {
            return true
        }
        
        return false
    }
    
    var buyukmu: Bool {
        guard let pass = person.password, let pass2 = person.password2 else { return false }
        
        if pass.count > 3 && pass2.count > 3 {
            return true
        }
        return false
    }
    
}
