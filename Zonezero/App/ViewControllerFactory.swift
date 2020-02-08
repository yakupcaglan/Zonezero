//
//  ViewControllerFactory.swift
//  Zonezero
//
//  Created by yakup caglan on 8.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import Foundation

protocol ViewControllerFactory {
    
    func makeRegisterViewController() -> RegisterViewController
    func makeLoginViewController(person: Person) -> LoginViewController
    func makeMovieListController() -> MovieListViewController
}
