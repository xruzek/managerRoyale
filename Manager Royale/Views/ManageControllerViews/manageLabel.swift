//
//  manageLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/2/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class manageLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = font.withSize(13)
        textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set up the first Labels in the views
    func setUpFirst(view: UIView, name: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        font = font.withSize(16)
        text = name
    }
    
    // Set up the name
    func setUp(view: UIView, topLabel: UILabel, name: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        text = name
    }
    
    // set up the amount
    func setUp(view: UIView, adjacentlabel: UILabel, name: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        centerYAnchor.constraint(equalTo: adjacentlabel.centerYAnchor).isActive = true
        leftAnchor.constraint(equalTo: adjacentlabel.rightAnchor).isActive = true
        heightAnchor.constraint(equalTo: adjacentlabel.heightAnchor).isActive = true
        
        textAlignment = .right
        text = name
    }
    
}
