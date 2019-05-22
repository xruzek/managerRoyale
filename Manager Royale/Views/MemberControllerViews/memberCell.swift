//
//  memberCell.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberCell: UITableViewCell {
    
    //var indexLabel = RRCellLabel()
    var name = RRInfoLabel()
    var warWins = RRInfoLabel()
    var warWinsAmount = RRInfoLabel()
    var trophies = RRInfoLabel()
    var donationLabel = RRInfoLabel()
    var donationAmount = RRInfoLabel()
    var roleLabel = RRInfoLabel()
    var CCDescription = RRCellLabel()
    
    var offset:CGFloat = GlobalVariables.cellOffset
    
    var labelHeight = GlobalVariables.cellHeight
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //self.addSubview(indexLabel)
        self.addSubview(name)
        self.addSubview(warWins)
        self.addSubview(warWinsAmount)
        self.addSubview(trophies)
        self.addSubview(donationLabel)
        self.addSubview(donationAmount)
        self.addSubview(roleLabel)
        
    }
    
    func setUpCell(index: Int) {
        let member = GlobalVariables.activeClan.playerArray[index]
       
        // cell index
        /*indexLabel.setTopLeft(view: self, topAnchor: self.topAnchor , leftAnchor: self.leftAnchor, height: GlobalVariables.cellHeight)
        indexLabel.text = String(index + 1)
        indexLabel.font = indexLabel.font.withSize(12)
        */
        
        // member name & trophies
        name.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: true)
        name.text = member.name
        
        trophies.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: false)
        trophies.text = String(member.trophies)
        
        globalAddLine(leftLabel: name, rightLabel: trophies, view: self)
        
        // role
        roleLabel.setSmall()
        roleLabel.setConstraints(topAnchor: name.bottomAnchor, view: self, sideLeft: true)
        roleLabel.text = member.role
        
        // amount of war days won
        warWins.setConstraints(topAnchor: roleLabel.bottomAnchor, view: self, sideLeft: true)
        warWins.text = "War Days Won"
        
        warWinsAmount.setConstraints(topAnchor: roleLabel.bottomAnchor, view: self, sideLeft: false)
        warWinsAmount.text = String(member.warDaysWon)
        
        globalAddLine(leftLabel: warWins, rightLabel: warWinsAmount, view: self)
        
        // donation label
        donationLabel.setConstraints(topAnchor: warWinsAmount.bottomAnchor, view: self, sideLeft: true)
        donationLabel.text = "Donations"
        
        // donation amount
        donationAmount.setConstraints(topAnchor: warWinsAmount.bottomAnchor, view: self, sideLeft: false)
        donationAmount.text = String(member.donations)
        
        globalAddLine(leftLabel: donationLabel, rightLabel: donationAmount, view: self)
        
        // set Color of the member's cell
        self.backgroundColor = setMemberColor(clan: GlobalVariables.activeClan, member: GlobalVariables.activeClan.playerArray[index]).withAlphaComponent(0.15)
        
        // give member cell a white border
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.white.cgColor
        
    }
    // setWarColor(clan: GlobalVariables.activeClan, member: GlobalVariables.activeClan.playerArray[index])
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
