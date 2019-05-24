//
//  RRInactiveWarView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/16/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRInactiveWarView: UIView {
    var member = players()
    
    var viewHeight:CGFloat = GlobalVariables.warViews
    
    var name = RRInfoLabel()
    var trophies = RRInfoLabel()
    var role = RRInfoLabel()
    var lastUpdated = RRInfoLabel()
    var warLabel = RRInfoLabel()
    var warAmount = RRInfoLabel()
    var timeInClanLabel = RRInfoLabel()
    var timeInClanAmount = RRInfoLabel()
    var lastPlayedLabel = RRInfoLabel()
    var lastPlayedAmount = RRInfoLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.rexGold.withAlphaComponent(0.05)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        
        addSubview(name)
        addSubview(role)
        addSubview(trophies)
        addSubview(lastUpdated)
        addSubview(warLabel)
        addSubview(warAmount)
        addSubview(timeInClanLabel)
        addSubview(timeInClanAmount)
        addSubview(lastPlayedLabel)
        addSubview(lastPlayedAmount)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUp(newMember: players, topAnchor: NSLayoutYAxisAnchor, view: UIView) {
        member = newMember
        
        self.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMember))
        gesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
        
        // name
        name.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: true)
        name.text = newMember.name
        name.textColor = name.textColor.withAlphaComponent(1)
        name.font = UIFont(name: Fonts.bolderFont, size: GlobalVariables.labelFontSize)
        
        // role
        role.setSmall()
        role.setConstraints(topAnchor: name.bottomAnchor, view: self, sideLeft: true)
        role.text = member.role
        
        // trophies
        trophies.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: false)
        trophies.text = String(member.trophies)
        
        globalAddLine(leftLabel: name, rightLabel: trophies, view: self)
        
        // war participation
        warLabel.setConstraints(topAnchor: role.bottomAnchor, view: self, sideLeft: true)
        warLabel.text = "Total War Days Involved In"
        
        warAmount.setConstraints(topAnchor: role.bottomAnchor, view: self, sideLeft: false)
        warAmount.text = String(member.warDaysInvolvedIn)
        
        globalAddLine(leftLabel: warLabel, rightLabel: warAmount, view: self)
        
        // Time in Clan
        timeInClanLabel.setConstraints(topAnchor: warLabel.bottomAnchor, view: self, sideLeft: true)
        timeInClanLabel.text = "Time In Clan"
        
        timeInClanAmount.setConstraints(topAnchor: warAmount.bottomAnchor, view: self, sideLeft: false)
        if member.timeInClan! > 36 {
            timeInClanAmount.text = String(Int(member.timeInClan!/24)) + " days"
        } else {
            timeInClanAmount.text = String(Int(member.timeInClan!)) + " hours"
        }
        
        globalAddLine(leftLabel: timeInClanLabel, rightLabel: timeInClanAmount, view: self)
        
        // last played
        lastPlayedLabel.setConstraints(topAnchor: timeInClanLabel.bottomAnchor, view: self, sideLeft: true)
        lastPlayedLabel.text = "Last Battle"
        
        lastPlayedAmount.setConstraints(topAnchor: timeInClanAmount.bottomAnchor, view: self, sideLeft: false)
        lastPlayedAmount.text = String(member.timeSinceLastBattle!) + " Days"
        
        globalAddLine(leftLabel: lastPlayedLabel, rightLabel: lastPlayedAmount, view: self)
        
        // donations
        let memberDonations = addInfoLine(scrollView: self, view: self, topAnchor: lastPlayedLabel.bottomAnchor, title: "donations", amount: String(member.donations))
        
    }

    @objc func showMember() {
        manageViewDelegate.showMember(member: member)
        
    }
    
}
