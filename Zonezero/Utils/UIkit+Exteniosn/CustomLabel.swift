//
//  CustomLabel.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

final class CustomLabel: UILabel {
    
    required init(text: String, fontSize: CGFloat = 13) {
        super.init(frame: .zero)
        
        self.text = text
        
        numberOfLines = 2
        textColor = .gray
        
        
        font = UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
