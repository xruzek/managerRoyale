//
//  RRCellLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/11/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRCellLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = Colors.rexGold.withAlphaComponent(0.35)
        self.sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
       // backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // set top left constraints
    func setTopLeft(view: UIView, topAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, height: CGFloat) {
        self.topAnchor.constraint(equalTo: topAnchor, constant: GlobalVariables.cellOffset).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    // set CC and other labels
    func setTopLeftOther(view: UIView, topAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, height: CGFloat) {
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    // set bottom left Constraints
    func setBottomLeft(view: UIView, bottomAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, height: CGFloat) {
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: GlobalVariables.cellOffset).isActive = true
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    // set top right constraints
    func setTopRight(view: UIView, topAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, height: CGFloat, isValue:Bool) {
        self.topAnchor.constraint(equalTo: topAnchor, constant: GlobalVariables.cellOffset).isActive = true
        if isValue {
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        } else {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.screenWidth/2).isActive = true
        }
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    // set bottom right Constraints
    func setBottomRight(view: UIView, bottomAnchor: NSLayoutYAxisAnchor, leftAnchor: NSLayoutXAxisAnchor, height: CGFloat, isValue: Bool) {
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -GlobalVariables.cellOffset).isActive = true
        if isValue {
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        } else {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.screenWidth/2).isActive = true
        }
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    // set contraints for the trophy
    func setOtherConstraints(view: UIView, topAnchor: NSLayoutYAxisAnchor, rightAnchor: NSLayoutXAxisAnchor, height: CGFloat) {
        
        self.topAnchor.constraint(equalTo: topAnchor, constant: GlobalVariables.cellOffset).isActive = true
        
       
        self.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
