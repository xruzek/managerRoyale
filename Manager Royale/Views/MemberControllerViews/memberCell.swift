//
//  memberCell.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberCell: UITableViewCell {
    /*var nameLabel = memberCellLabel()
    var nameView = memberCellView()
    var warView = memberCellView()
    var donationView = memberCellView()*/
    
    var indexLabel = RRCellLabel()
    var name = RRCellLabel()
    var warWins = RRCellLabel()
    var warWinsAmount = RRCellLabel()
    var trophies = RRCellLabel()
    var donationLabel = RRCellLabel()
    var donationAmount = RRCellLabel()
    var roleLabel = RRCellLabel()
    var CCDescription = RRCellLabel()
    
    
    var offset:CGFloat = GlobalVariables.cellOffset
    
    var labelHeight = GlobalVariables.cellHeight
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        /*self.addSubview(nameView)
        self.addSubview(warView)
        self.addSubview(donationView)*/
        
        self.addSubview(indexLabel)
        self.addSubview(name)
        self.addSubview(warWins)
        self.addSubview(warWinsAmount)
        self.addSubview(trophies)
        self.addSubview(donationLabel)
        self.addSubview(donationAmount)
        self.addSubview(roleLabel)
        self.addSubview(CCDescription)
    }
    
    func setUpCell(index: Int) {
       
        // cell index
        indexLabel.setTopLeft(view: self, topAnchor: self.topAnchor , leftAnchor: self.leftAnchor, height: GlobalVariables.cellHeight)
        indexLabel.text = String(index + 1)
        indexLabel.font = indexLabel.font.withSize(12)
        
        // member name
        name.setTopLeft(view: self, topAnchor: self.topAnchor, leftAnchor: indexLabel.rightAnchor, height: GlobalVariables.cellHeight/2 - GlobalVariables.cellOffset)
        name.text = GlobalVariables.activeClan.playerArray[index].name
        
        // Role & CC
        roleLabel.setTopLeftOther(view: self, topAnchor: name.bottomAnchor, leftAnchor: indexLabel.rightAnchor, height: labelHeight/4 - 10)
        roleLabel.font = roleLabel.font.withSize(12)
        roleLabel.text = GlobalVariables.activeClan.playerArray[index].role + " : " + String(Int(GlobalVariables.activeClan.playerArray[index].Worth)) + " CC"
        
        // Description of CC
        CCDescription.setTopLeft(view: self, topAnchor: roleLabel.bottomAnchor, leftAnchor: indexLabel.rightAnchor, height: labelHeight/4 - 10)
        CCDescription.font = CCDescription.font.withSize(11)
        CCDescription.text = "(Clan Contrubution)"
        
        // amount of war days won
        warWinsAmount.setTopRight(view: self, topAnchor: self.topAnchor, leftAnchor: self.leftAnchor, height: GlobalVariables.cellHeight/2 - GlobalVariables.cellOffset, isValue: true)
        warWinsAmount.text = String(GlobalVariables.activeClan.playerArray[index].warDaysWon)
        
        // war days won label
        warWins.setTopRight(view: self, topAnchor: self.topAnchor, leftAnchor: self.leftAnchor, height: GlobalVariables.cellHeight/2 - GlobalVariables.cellOffset , isValue: false)
        warWins.text = "War Days Won"
        
        globalAddLine(leftLabel: warWins, rightLabel: warWinsAmount, view: self)
        
        // trophies
        trophies.setOtherConstraints(view: self, topAnchor: self.topAnchor, rightAnchor: warWins.leftAnchor, height: GlobalVariables.cellHeight/2 - GlobalVariables.cellOffset)
        trophies.text = String(GlobalVariables.activeClan.playerArray[index].trophies)
        
        globalAddLine(leftLabel: name, rightLabel: trophies, view: self)
        
        // donation label
        donationLabel.setBottomRight(view: self, bottomAnchor: self.bottomAnchor, leftAnchor: self.leftAnchor, height: GlobalVariables.cellHeight/2 - GlobalVariables.cellOffset, isValue: false)
        donationLabel.text = "Donations"
        
        // donation amount
        donationAmount.setBottomRight(view: self, bottomAnchor: self.bottomAnchor, leftAnchor: indexLabel.rightAnchor, height: GlobalVariables.cellHeight/2 - GlobalVariables.cellOffset, isValue: true)
        donationAmount.text = String(GlobalVariables.activeClan.playerArray[index].donations)
        
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
