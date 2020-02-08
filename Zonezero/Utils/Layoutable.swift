//
//  Layoutable.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

typealias LayoutableView = UIView & Layoutable

public protocol Layoutable: AnyObject {
    
    func setupViews()
    
    func setupLayout()
}

public extension Layoutable where Self: UIView {
    
    static func create() -> Self {
        let view  = Self()
        
        view.backgroundColor = .white
       
        view.setupViews()
        
        view.setupLayout()
        
        return view
    }
}
