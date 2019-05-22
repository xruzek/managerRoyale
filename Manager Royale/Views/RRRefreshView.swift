//
//  RRRefreshView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/16/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRRefreshView: UIView {
    
    var member: players?
    var clan: theClan?
    
    var refreshButton = UIButton()
    var refreshLabel = UILabel()
    let myActInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        refreshLabel.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.gray.withAlphaComponent(0.05)
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(topAnchor: NSLayoutYAxisAnchor, view: UIView, isClan: Bool, newMember: players? = players()) {
        self.member = newMember
        
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Label
        var message = ""
        var title = ""
        if isClan {
            message = "This Clan has not been updated in a while, would you like to update it?"
            title = "Update Clan"
            self.topAnchor.constraint(equalTo: topAnchor, constant: 84).isActive = true
            refreshButton.addTarget(self, action: #selector(refreshClan), for: .touchUpInside)
            
        } else {
            message = "This Member has not been updated in a while, would you like to update them? "
            title = "Update Member"
            self.topAnchor.constraint(equalTo: topAnchor, constant: 84).isActive = true
            refreshButton.addTarget(self, action: #selector(refreshMember), for: .touchUpInside)
        }
        
        self.addSubview(refreshLabel)
        refreshLabel.text = message
        refreshLabel.font = UIFont(name: Fonts.lighterFont, size: 15)
        
        refreshLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        refreshLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        refreshLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        refreshLabel.numberOfLines = 0
        
        // button
        self.addSubview(refreshButton)
        refreshButton.setTitle(title, for: .normal)
        refreshButton.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = 5
        
        refreshButton.topAnchor.constraint(equalTo: refreshLabel.bottomAnchor, constant: 15).isActive = true
        refreshButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        refreshButton.widthAnchor.constraint(equalToConstant: 195).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        refreshButton.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        refreshButton.setTitleColor(.black, for: .normal)
        
        self.bottomAnchor.constraint(equalTo: refreshButton.bottomAnchor, constant: 20).isActive = true
        
    }
    
    @objc func refreshClan() {
        //refreshLabel.isHidden = true
        //refreshButton.isHidden = true
        refreshButton.backgroundColor = .gray
        
        // ****** Play Add *******
        
        refreshClanInfo(withLocation: GlobalVariables.activeClan.clanTag) { (completionMessage: String) in
            print(completionMessage)
            if completionMessage == "worked" {
                print("Updated")
                DispatchQueue.main.async {
                    print("Updated")
                    mainScreen.viewDidLoad()
                    mainScreen.viewWillAppear(true)
                }
            }else {
                print(completionMessage)
            }
        }
    }
    
    @objc func refreshMember() {
        // Do special refresh
        refreshButton.backgroundColor = .gray
        
        
    }
    
}
/*
 var refreshLabel = addLabel(view: self, topAnchor: topAnchor, title: message)
 refreshLabel.numberOfLines = 0
 refreshLabel.font = refreshLabel.font.withSize(12)
 */

