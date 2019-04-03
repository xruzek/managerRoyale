//
//  DescriptiveLables.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class DescriptiveLables: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // sets up the textSize, font, color..ect
    func setUpLabel(){
        //font = self.font.withSize(20)  // default is 17
        
        //textColor = Colors.rexGold
        //backgroundColor = Colors.rexLightBlueGray
    }
    
    // sets up constraints if it is the first label & adds the text to it
    func setUpLabel(newText: String, height: Double, width: Double, view: UIView) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: CGFloat(10 + width/2)).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(height + 100)).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        text = "   " + newText
    }

    // sets up contraints if it is not the first lable & adds the text
    func setUpLabel(newText: String, height: Double, width: Double, view: UIView, otherDL: UILabel) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: CGFloat(10 + width/2)).isActive = true
        self.topAnchor.constraint(equalTo: otherDL.bottomAnchor, constant: CGFloat(height)).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        text = "   " + newText
    }
    
    //sets up the mutable lable's contraints & text
    func setUpLabel(newText:String, width: Double, adjacentLabel: UILabel, view: UIView) {
        textAlignment = .right
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: CGFloat((width/2))).isActive = true
        self.centerYAnchor.constraint(equalTo: adjacentLabel.centerYAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        text = newText
        
        
    }
    
}
