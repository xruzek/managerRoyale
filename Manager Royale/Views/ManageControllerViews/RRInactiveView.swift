//
//  RRInactiveView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/14/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRInactiveView: UIView {

    var member = players()
    
    var viewHeight:CGFloat = GlobalVariables.inactiveMemberView
    
    var name = RRInfoLabel()
    var trophies = RRInfoLabel()
    var role = RRInfoLabel()
    var lastUpdated = RRInfoLabel()
    var lastPlayedLabel = RRInfoLabel()
    var lastPlayedAmount = RRInfoLabel()
    var warLabel = RRInfoLabel()
    var warAmount = RRInfoLabel()
    
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
        addSubview(lastPlayedLabel)
        addSubview(lastPlayedAmount)
        addSubview(warLabel)
        addSubview(warAmount)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUp(newMember: players, topAnchor: NSLayoutYAxisAnchor, view: UIView) {
        self.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        // name
        member = newMember
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
        
        // last played
        lastPlayedLabel.setConstraints(topAnchor: role.bottomAnchor, view: self, sideLeft: true)
        lastPlayedLabel.text = "Last Battle"
        
        lastPlayedAmount.setConstraints(topAnchor: role.bottomAnchor, view: self, sideLeft: false)
        lastPlayedAmount.text = String(member.timeSinceLastBattle!) + " Days"
        
        globalAddLine(leftLabel: lastPlayedLabel, rightLabel: lastPlayedAmount, view: self)
        
        // war participation
        warLabel.setConstraints(topAnchor: lastPlayedLabel.bottomAnchor, view: self, sideLeft: true)
        warLabel.text = "Total War Days Involved In"
        
        warAmount.setConstraints(topAnchor: lastPlayedAmount.bottomAnchor, view: self, sideLeft: false)
        warAmount.text = String(member.warDaysInvolvedIn)
        
        globalAddLine(leftLabel: warLabel, rightLabel: warAmount, view: self)
        
        // donations
        let memberDonaitons = addInfoLine(scrollView: self, view: self, topAnchor: warLabel.bottomAnchor, title: "Donations", amount: String(member.donations))
        
    }
    
    
    
    
}
