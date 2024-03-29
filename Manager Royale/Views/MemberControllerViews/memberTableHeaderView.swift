//
//  memberTableHeaderView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/31/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberTableHeaderView: UIView {
    // labels that change when a cell is tapped
    var avgWarPart = RRCellLabel()
    var warPartAmount = RRCellLabel()
    var avgWarWins = RRCellLabel()
    var warWinsAmount = RRCellLabel()
    var avgDonations = RRCellLabel()
    var donationAmount = RRCellLabel()
    
    var sortTypeLabel = RRCellLabel()
    
    
    
    var height = ((GlobalVariables.cellHeaderHeight - 25) / 3) - GlobalVariables.cellOffset
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the Labels to the view
        addSubview(avgWarPart)
        addSubview(warPartAmount)
        addSubview(avgWarWins)
        addSubview(warWinsAmount)
        addSubview(avgDonations)
        addSubview(donationAmount)
        
        addSubview(sortTypeLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = .white
        // give member cell a white border
        //self.layer.borderWidth = 4
        //self.layer.borderColor = UIColor.black.cgColor
        
        // Adds the DropDown Menu
        var button = DropDownButton()
        
        button = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        addSubview(button)
        button.editConstraints(view: self)
       
        
        // Average War Participation
        avgWarPart.setTopLeft(view: self, topAnchor: self.topAnchor, leftAnchor: self.leftAnchor, height: height)
        avgWarPart.text = "Average War Participants"
        
        warPartAmount.setTopRight(view: self, topAnchor: self.topAnchor, leftAnchor: self.leftAnchor, height: height, isValue: true)
        warPartAmount.text = String(GlobalVariables.activeClan.totalWarDaysInvolvedIn/10)
        
        globalAddLine(leftLabel: avgWarPart, rightLabel: warPartAmount, view: self)
        
        // Average War Win Percentage
        avgWarWins.setTopLeft(view: self, topAnchor: avgWarPart.bottomAnchor, leftAnchor: self.leftAnchor, height: height)
        avgWarWins.text = "Average Win Percentage"
       
        warWinsAmount.setTopRight(view: self, topAnchor: warPartAmount.bottomAnchor, leftAnchor: self.leftAnchor, height: height, isValue: true)
        var winPercent:Double = 0
        var amount:Double = 0
        for member in GlobalVariables.activeClan.playerArray {
            if member.winPercent != 0 {
                winPercent += member.winPercent!
                amount += 1
            }
        }
        if winPercent == 0 {
            warWinsAmount.text = "0 %"
        } else {
            warWinsAmount.text = String(Int(winPercent/amount)) + " %"
        }
        globalAddLine(leftLabel: avgWarWins, rightLabel: warWinsAmount, view: self)
        
        // Average Donations
        avgDonations.setTopLeft(view: self, topAnchor: avgWarWins.bottomAnchor, leftAnchor: self.leftAnchor, height: height)
        avgDonations.text = "Average Donations"
        
        donationAmount.setTopRight(view: self, topAnchor: warWinsAmount.bottomAnchor, leftAnchor: self.leftAnchor, height: height, isValue: true)
        donationAmount.text = String(GlobalVariables.activeClan.totalDonations/GlobalVariables.activeClan.totalMembers)
        
        globalAddLine(leftLabel: avgDonations, rightLabel: donationAmount, view: self)
        
        //sort type label
        sortTypeLabel.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        sortTypeLabel.leftAnchor.constraint(equalTo: button.rightAnchor, constant: 10).isActive = true
        sortTypeLabel.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        sortTypeLabel.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        sortTypeLabel.text = "Trophies"
        
    }
    
    // changes the sort type label
    func changeSortTypeLabel(sortType: String) {
        sortTypeLabel.text = sortType
    }
   
    
}
