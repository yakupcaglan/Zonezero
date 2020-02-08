//
//  CheckboxView.swift
//  Zonezero
//
//  Created by yakup caglan on 6.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit
import SnapKit

final class CheckboxView: UIControl {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 28, height: 28)
    }
    
    enum SelectionState {
        case normal
        case selected
    }
    
     private (set) var selectionState: SelectionState = .normal {
        didSet {
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
                self.backgroundColor = self.selectionState == .normal ? .twitterBlue : .clear
            }, completion: { _ in
                self.sendActions(for: .valueChanged)
            })
        }
    }
    
    required init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
        
        layer.cornerRadius = intrinsicContentSize.width / 2
        layer.masksToBounds = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        toggleSelectionState()
    }
    
    private func toggleSelectionState() {
        selectionState = selectionState == .normal ? .selected : .normal
    }
    
}
