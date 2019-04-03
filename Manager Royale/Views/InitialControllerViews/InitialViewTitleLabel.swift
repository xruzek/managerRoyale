//
//  InitialViewTitleLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class InitialViewTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLabel() {
        text = "Enter Your Clan Tag Here"
        font = self.font.withSize(20)
        textAlignment = .center
        
        textColor = .black
        layer.masksToBounds = true
        layer.cornerRadius = 10
        tintColor = Colors.rexLightBlueGray
        backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
    
    func setUp(view: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
    }
}
