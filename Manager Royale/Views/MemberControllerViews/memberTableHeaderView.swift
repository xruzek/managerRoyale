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
        
        // Adds the DropDown Menu
        var button = DropDownButton()
        button = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.addSubview(button)
        button.editConstraints(view: self)
        
        // Average War Participation
        avgWarPart.setTopLeft(view: self, topAnchor: self.topAnchor, leftAnchor: self.leftAnchor, height: height)
        avgWarPart.text = "Average War Participants"
        
        warPartAmount.setTopRight(view: self, topAnchor: self.topAnchor, leftAnchor: self.leftAnchor, height: height, isValue: true)
        warPartAmount.text = String(GlobalVariables.activeClan.totalWarDaysInvolvedIn/10)
        
        // Average War Wins
        avgWarWins.setTopLeft(view: self, topAnchor: avgWarPart.bottomAnchor, leftAnchor: self.leftAnchor, height: height)
        avgWarWins.text = "Average War Wins"
       
        warWinsAmount.setTopRight(view: self, topAnchor: warPartAmount.bottomAnchor, leftAnchor: self.leftAnchor, height: height, isValue: true)
        warWinsAmount.text = String(GlobalVariables.activeClan.totalWarDayWins/GlobalVariables.activeClan.totalParticipants)
        
        // Average Donations
        avgDonations.setTopLeft(view: self, topAnchor: avgWarWins.bottomAnchor, leftAnchor: self.leftAnchor, height: height)
        avgDonations.text = "Average Donations"
        
        donationAmount.setTopRight(view: self, topAnchor: warWinsAmount.bottomAnchor, leftAnchor: self.leftAnchor, height: height, isValue: true)
        donationAmount.text = String(GlobalVariables.activeClan.totalDonations/GlobalVariables.activeClan.totalMembers)
        
    }
    
   
    
}
