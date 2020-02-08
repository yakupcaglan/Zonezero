//
//  MovieCell.swift
//  Zonezero
//
//  Created by yakup caglan on 8.02.2020.
//  Copyright © 2020 yakup caglan. All rights reserved.
//

import UIKit

class MovieCell: CollectionViewCell<Movies> {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    override func setupViews() {
        add(titleLabel)
        
        backgroundColor = .white
        
    }
    
    override func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(8)
        }
    }
}
