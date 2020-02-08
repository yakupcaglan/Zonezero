//
//  TextField+Extension.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

final class TextField: UITextField {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 50)
    }
    
    private let insets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

    required init(placaholder: String, isSecureTextEntry: Bool = false, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        self.placeholder = placaholder
        self.isSecureTextEntry = isSecureTextEntry
        self.keyboardType = keyboardType
        self.returnKeyType = .done
        
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = bounds.inset(by: insets)
        return rect
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = bounds.inset(by: insets)
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = bounds.inset(by: insets)
        return rect
    }
    
}
