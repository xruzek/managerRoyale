//
//  memberCellLabel.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit


class memberCellLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = Colors.rexGold.withAlphaComponent(0.35)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*********************************
     Labels for the nameView
     *********************************/
    // name Label
    func setUpCellLabel(view: UIView, leftLabel: UILabel, index: Int) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: leftLabel.leftAnchor, constant: 15).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        font = font.withSize(13)
        text = GlobalVariables.activeClan.playerArray[index].name
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    
    // Index label
    func setUpIndex(view: UIView, index: Int) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        self.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        text = String(index + 1)
        font = font.withSize(12)
    }
    
    // role label
    func setUpRole(view: UIView, leftLabel: UILabel, topLabel: UILabel, index: Int) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: leftLabel.leftAnchor, constant: 15).isActive = true
        self.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        font = font.withSize(10)
        text = GlobalVariables.activeClan.playerArray[index].role
        
    }
    
    // trophy label
    func setUpTrophy(view: UIView, leftLabel: UILabel, topLabel: UILabel, index: Int) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: leftLabel.leftAnchor, constant: 15).isActive = true
        self.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        font = font.withSize(13)
        textColor = Colors.rexGold
        text = String(GlobalVariables.activeClan.playerArray[index].trophies)
        
    }
    
    /*********************************
     Labels for the War & DonationView
     *********************************/
    
    // descriptive war labels, this on is for the first label
    func setUpDescriptiveWar( view: UIView, index: Int, newText: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        self.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        font = font.withSize(11)
        textColor = .black
        text = newText
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
    
    // descriptive war labels
    func setUpDescriptiveWar( view: UIView, topLabel: UILabel, index: Int, newText: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6).isActive = true
        self.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8).isActive = true
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        self.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
       
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        font = font.withSize(11)
        textColor = .black
        text = newText
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
    
    // labels that change
    func setUpChangingWarLabels(view: UIView, adjacentLabel: UILabel, index: Int, newText: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.centerYAnchor.constraint(equalTo: adjacentLabel.centerYAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: adjacentLabel.widthAnchor, multiplier: 0.4).isActive = true
        self.heightAnchor.constraint(equalToConstant: 15).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6).isActive = true
        
        textAlignment = .center
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        font = font.withSize(11)
        textColor = .black
        text = newText
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
    
    /*********************************
     Labels for the Header Cell
     *********************************/
    // name label
    func setUpLabel(view: UIView, index: Int) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        text = "   " + GlobalVariables.activeClan.playerArray[index].name
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    
    // below name label
    func setUpLabel(view: UIView, topLabel: UILabel, name: String) {
        
        
    }
    
    // right of the name label
    func setUpLabel(view:UIView, adjacentLabel: UILabel, name: String) {
        
        
    }
    
 
    
}


