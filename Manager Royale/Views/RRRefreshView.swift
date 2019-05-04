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
        
        var message = ""
        var title = ""
        if isClan {
            message = "This Clan has not been updated in a while, would you like to update it?"
            title = "Update Clan"
            self.topAnchor.constraint(equalTo: topAnchor).isActive = true
            refreshButton.addTarget(self, action: #selector(refreshClan), for: .touchUpInside)
            
        } else {
            message = "This Member has not been updated in a while, would you like to update them? "
            title = "Update Member"
            self.topAnchor.constraint(equalTo: topAnchor, constant: 84).isActive = true
            refreshButton.addTarget(self, action: #selector(refreshMember), for: .touchUpInside)
        }
        
        self.addSubview(refreshLabel)
        refreshLabel.text = message
        
        refreshLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        refreshLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        refreshLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        refreshLabel.numberOfLines = 0
        
        self.addSubview(refreshButton)
        refreshButton.setTitle(title, for: .normal)
        refreshButton.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        refreshButton.layer.masksToBounds = true
        refreshButton.layer.cornerRadius = 5
        
        refreshButton.topAnchor.constraint(equalTo: refreshLabel.bottomAnchor, constant: 15).isActive = true
        refreshButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        refreshButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.bottomAnchor.constraint(equalTo: refreshButton.bottomAnchor, constant: 15).isActive = true
        
    }
    
    @objc func refreshClan() {
        refreshLabel.isHidden = true
        refreshButton.isHidden = true
        
        self.addSubview(myActInd)
        myActInd.topAnchor.constraint(equalTo: refreshButton.topAnchor).isActive = true
        myActInd.centerXAnchor.constraint(equalTo: refreshButton.centerXAnchor).isActive = true
        myActInd.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myActInd.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        myActInd.startAnimating()
        
        refreshClanInfo(withLocation: GlobalVariables.activeClan.clanTag) { (completionMessage: String) in
            print(completionMessage)
            if completionMessage == "worked" {
                print("Updated")
                DispatchQueue.main.async {
                    self.myActInd.stopAnimating()
                    // reload the view/app
                }
                
            }else {
                print(completionMessage)
            }
        }
    }
    
    @objc func refreshMember() {
        // Do special refresh
        refreshLabel.isHidden = true
        refreshButton.isHidden = true
        
        self.addSubview(myActInd)
        myActInd.topAnchor.constraint(equalTo: refreshButton.topAnchor).isActive = true
        myActInd.centerXAnchor.constraint(equalTo: refreshButton.centerXAnchor).isActive = true
        myActInd.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myActInd.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        myActInd.startAnimating()
        
        refreshClanInfo(withLocation: GlobalVariables.activeClan.clanTag) { (completionMessage: String) in
            print(completionMessage)
            if completionMessage == "worked" {
                print("Updated")
                DispatchQueue.main.async {
                    self.myActInd.stopAnimating()
                    // reload the view/app
                }
                
            }else {
                print(completionMessage)
            }
        }
    }
    
}
/*
 var refreshLabel = addLabel(view: self, topAnchor: topAnchor, title: message)
 refreshLabel.numberOfLines = 0
 refreshLabel.font = refreshLabel.font.withSize(12)
 */

