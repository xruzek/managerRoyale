//
//  RRHurtingWarView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/15/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRHurtingWarView: UIView {

    var member = players()
    
    var viewHeight:CGFloat = GlobalVariables.warViews
    
    var name = RRInfoLabel()
    var role = RRInfoLabel()
    var trophies = RRInfoLabel()
    var warWinLabel = RRInfoLabel()
    var warWinAmount = RRInfoLabel()
    var warDayMissedLabel = RRInfoLabel()
    var warDayMissedAmount = RRInfoLabel()
    var warInvolvedLabel = RRInfoLabel()
    var warInvoledAmount = RRInfoLabel()
    var winPercentLabel = RRInfoLabel()
    var winPercentAmount = RRInfoLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.rexGold.withAlphaComponent(0.05)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        
        addSubview(name)
        addSubview(role)
        addSubview(trophies)
        addSubview(warWinLabel)
        addSubview(warWinAmount)
        addSubview(warDayMissedLabel)
        addSubview(warDayMissedAmount)
        addSubview(warInvolvedLabel)
        addSubview(warInvoledAmount)
        addSubview(winPercentLabel)
        addSubview(winPercentAmount)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUp(newMember: players, topAnchor: NSLayoutYAxisAnchor, view: UIView) {
        self.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        member = newMember
        
        // name
        name.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: true)
        name.text = member.name
        name.textColor = name.textColor.withAlphaComponent(1)
        
        // trophies
        trophies.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: false)
        trophies.text = String(member.trophies)
        
        globalAddLine(leftLabel: name, rightLabel: trophies, view: self)
        
        // role
        role.setSmall()
        role.setConstraints(topAnchor: name.bottomAnchor, view: self, sideLeft: true)
        role.text = member.role
        
        // war days won
        warWinLabel.setConstraints(topAnchor: role.bottomAnchor, view: self, sideLeft: true)
        warWinLabel.text = "War Days Won"
        
        warWinAmount.setConstraints(topAnchor: role.bottomAnchor, view: self, sideLeft: false)
        warWinAmount.text = String(member.warDaysWon)
        
        globalAddLine(leftLabel: warWinLabel, rightLabel: warWinAmount, view: self)
        
        // War Days Skipped
        warDayMissedLabel.setConstraints(topAnchor: warWinLabel.bottomAnchor, view: self, sideLeft: true)
        warDayMissedLabel.text = "War Days Skipped"
        
        warDayMissedAmount.setConstraints(topAnchor: warWinAmount.bottomAnchor, view: self, sideLeft: false)
        warDayMissedAmount.text = String(member.warDaysNotPlayed)
        
        globalAddLine(leftLabel: warDayMissedLabel, rightLabel: warDayMissedAmount, view: self)
        
        // War days involved in
        warInvolvedLabel.setConstraints(topAnchor: warDayMissedLabel.bottomAnchor, view: self, sideLeft: true)
        warInvolvedLabel.text = "Total War Days Involved In"
        
        warInvoledAmount.setConstraints(topAnchor: warDayMissedAmount.bottomAnchor, view: self, sideLeft: false)
        warInvoledAmount.text = String(member.warDaysInvolvedIn)
        
        globalAddLine(leftLabel: warInvolvedLabel, rightLabel: warInvoledAmount, view: self)
        
        // Win Percentage
        winPercentLabel.setConstraints(topAnchor: warInvolvedLabel.bottomAnchor, view: self, sideLeft: true)
        winPercentLabel.text = "Win Percentage"
        
        winPercentAmount.setConstraints(topAnchor: warInvoledAmount.bottomAnchor, view: self, sideLeft: false)
        winPercentAmount.text = String(Int(member.winPercent!)) + "%"
        
        globalAddLine(leftLabel: winPercentLabel, rightLabel: winPercentAmount, view: self)
        
    }
    
}
