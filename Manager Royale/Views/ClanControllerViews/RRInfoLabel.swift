//
//  RRInfoLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/5/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRInfoLabel: UILabel {

    var height:CGFloat = GlobalVariables.labelHeight
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sizeToFit()
        
        self.font = UIFont(name: Fonts.normalLabelFont, size: 17)
        //self.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // set custom height
    func setHeight(newHeight: CGFloat) {
        self.height = newHeight
    }
    
    // set constraints of the label
    func setConstraints(topAnchor: NSLayoutYAxisAnchor, view: UIView, sideLeft: Bool) {
        
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        if sideLeft {
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        } else {
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
            self.textAlignment = .right
        }
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    func setNormal(text:String) {
        
    }
    
    func setMedium() {
        font = UIFont(name: "HelveticaNeue-Bold", size: 19)
    }
    
    func setTitle() {
        font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        //height = 55
    }
    
    func setSmall() {
        textColor = .lightGray
        font = UIFont(name: Fonts.avenirNextMedium, size: 13)!
        height = 15
        
    }
}
