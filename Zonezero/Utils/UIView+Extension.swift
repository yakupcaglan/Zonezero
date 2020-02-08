//
//  UIView+Extension.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

public extension UIView {
    
    func add(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
