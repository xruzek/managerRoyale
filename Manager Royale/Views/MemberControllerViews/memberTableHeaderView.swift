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
    var name = memberCellLabel()
    var trophy = memberCellLabel()
    var statusLabel = memberCellLabel()
    var statusLevel = memberCellLabel()
    var warDaysMissed = memberCellLabel()
    var warDaysMissedAmount = memberCellLabel()
    var collectionBattlesMissed = memberCellLabel()
    var colBatMissedAmount = memberCellLabel()
    var warDayWL = memberCellLabel()
    var warDayRatio = memberCellLabel()
    var clanContribution = memberCellLabel()
    var contributionAmount = memberCellLabel()
    
    // labels that are alawys there
    var warDayStatsColLabel = memberCellLabel()
    var donationColLabel = memberCellLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // views that change when a cell its tapped
        addSubview(name)
        addSubview(trophy)
        addSubview(statusLabel)
        addSubview(statusLevel)
        addSubview(warDaysMissed)
        addSubview(warDaysMissedAmount)
        addSubview(collectionBattlesMissed)
        addSubview(colBatMissedAmount)
        addSubview(warDayWL)
        addSubview(warDayRatio)
        addSubview(clanContribution)
        addSubview(contributionAmount)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = UIColor.lightGray
        
        // Adds the DropDown Menu
        var button = DropDownButton()
        button = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.addSubview(button)
        button.editConstraints(view: self)
        
        
    }
    
    func displayMemberInfo(index: Int) {
        
        name.setUpLabel(view: self, index: index)
        
        
        
        
    }
    
}
