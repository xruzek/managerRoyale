//
//  tutorialForClanTagView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/29/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class tutorialForClanTagView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    
    func setUpView() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(view: UIView, saveButton: UIButton) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 40).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
