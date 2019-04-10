//
//  RRInfoLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/5/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRInfoLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(topAnchor: NSLayoutYAxisAnchor, view: UIView, sideLeft: Bool, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        if sideLeft {
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        } else {
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
            self.textAlignment = .right
        }
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -10).isActive = true
        //self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    func setNormal() {
        
    }
    
    func setTitle() {
        font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
    }
    
    func setSmall() {
        textColor = .lightGray
        font = UIFont(name: Fonts.avenirNextMedium, size: 12)!
        
    }
}
