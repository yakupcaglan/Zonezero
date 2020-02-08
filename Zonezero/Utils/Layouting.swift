//
//  Layouting.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

typealias LayoutableViewController = UIViewController & Layouting


public protocol Layouting: AnyObject {
    
    associatedtype ViewType: UIView & Layoutable
    
    var layoutableView: ViewType { get }
}

public extension Layouting where Self: UIViewController {
    
    var layoutableView: ViewType {
        guard let aView = view as? ViewType else {
            fatalError("\(ViewType.self)")
        }
        return aView
    }
}
