//
//  RRLabelLine.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/16/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRLabelLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.gray.withAlphaComponent(0.15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUp(leftAnchor: NSLayoutXAxisAnchor, rightAnchor: NSLayoutXAxisAnchor, centerAnchor: NSLayoutYAxisAnchor) {
        self.heightAnchor.constraint(equalToConstant: 1.25).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: 3).isActive = true
        self.rightAnchor.constraint(equalTo: rightAnchor, constant: -3).isActive = true
        self.centerYAnchor.constraint(equalTo: centerAnchor).isActive = true
        
    }
}
