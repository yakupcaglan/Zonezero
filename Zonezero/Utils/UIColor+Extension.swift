//
//  UIColor+Extension.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static var twitterBlue: UIColor {
        return .rgb(29, 161, 242)
    }
    
    static var mainColor: UIColor {
        return .rgb(236, 240, 241)
    }
}
