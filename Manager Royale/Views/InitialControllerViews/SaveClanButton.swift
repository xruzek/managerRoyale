//
//  SaveClanButton.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/29/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class SaveClanButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    func setUpButton() {
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.setTitle("Save", for: .normal)
        layer.cornerRadius = 10
        tintColor = Colors.seanDarkGrey
        backgroundColor       = UIColor.white.withAlphaComponent(0.7)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(view: UIView, textField: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90).isActive = true
        self.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 60).isActive = true
    }
    
    func setUp(view: UIView, saveButton: UIButton) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90).isActive = true
        self.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 60).isActive = true
    }
}


