//
//  rexTitleLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/2/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class rexTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(view: UIView, name: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        
        textColor = .black
        text = name
        font = font.withSize(30)
        layer.masksToBounds = false
        layer.cornerRadius = 5
    }
}
