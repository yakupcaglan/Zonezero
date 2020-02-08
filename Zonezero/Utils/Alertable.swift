//
//  Alertable.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

protocol Alertable {
    func showAlert(title: String, message: String?, alertActions: UIAlertAction...)
}

extension Alertable where Self: UIViewController {
    func showAlert(title: String, message: String?, alertActions: UIAlertAction...) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in alertActions {
            alertController.addAction(action)
        }
        
        present(alertController, animated: true)
    }
}
