//
//  memberCell.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberCell: UITableViewCell {
    var nameLabel = memberCellLabel()
    var nameView = memberCellView()
    var warView = memberCellView()
    var donationView = memberCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(nameView)
        self.addSubview(warView)
        self.addSubview(donationView)
        
    }
    
    func setUpCell(index: Int) {
       
        nameView.setUpNameView(view: self, index: index)
        
        donationView.setUpDonationsView(view: self, index: index)
        
        warView.setUpWarView(view: self, index: index, leftView: nameView, rightView: donationView)
        
        
        self.backgroundColor = setWarColor(clan: GlobalVariables.activeClan, member: GlobalVariables.activeClan.playerArray[index])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
