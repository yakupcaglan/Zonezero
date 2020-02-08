//
//  DependencyContainer.swift
//  Zonezero
//
//  Created by yakup caglan on 8.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import Foundation


final class DependencyContainer {
    
    private let person: Person
    
    public required init(person: Person = .init()) {
        self.person = person
    }
}

extension DependencyContainer: ViewControllerFactory {
 
    func makeRegisterViewController() -> RegisterViewController {
        let viewModel = RegisterViewModel(person: person)
        let viewController = RegisterViewController(viewModel: viewModel)
        
        return viewController
    }

    func makeLoginViewController(person: Person) -> LoginViewController {
        let viewModel = LoginViewModel(person: person)
        let viewController = LoginViewController(viewModel: viewModel)
        
        return viewController
     }
    
    func makeMovieListController() -> MovieListViewController {
        let controller = MovieListViewController()
        return controller
    }
    
}
