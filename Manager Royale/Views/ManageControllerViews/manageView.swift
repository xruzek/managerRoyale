//
//  manageView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/2/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class manageView: UIView {
    var inactiveTitleLabel = manageLabel()
    var hurtingTitleLabel = manageLabel()
    let clan = GlobalVariables.activeClan
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // sets up the Inactive member view
    func setUpInactive(view: UIView, fullLabel: UILabel) {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 7
        layer.borderColor = UIColor.gray.cgColor
        backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: fullLabel.bottomAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        
       
        clan.sortArray(sortType: "Days Inactive")
        addSubview(inactiveTitleLabel)
        inactiveTitleLabel.setUpFirst(view: self, name: "Inactive Members")
        
        var count = 0
        var priviousLabel = inactiveTitleLabel
        
        for each in clan.playerArray {
            let newLabel = manageLabel()
            addSubview(newLabel)
            newLabel.setUp(view: self, topLabel: priviousLabel, name: each.name)
            
            let otherLabel = manageLabel()
            addSubview(otherLabel)
            otherLabel.setUp(view: self, adjacentlabel: newLabel, name: String(each.timeSinceLastBattle!) + " Days")
            priviousLabel = newLabel
            
            count += 1
            if count == 10 {
                break
            }
        }
    }
    
    // sets up the hurting clan view
    func setUpHurting(view: UIView, fullLabel: UILabel) {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 7
        layer.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
        backgroundColor = UIColor.red.withAlphaComponent(0.1)
    
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: fullLabel.bottomAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        // Need algorithm for this
        clan.sortArray(sortType: "byWarDaysNotPlayed")
        addSubview(hurtingTitleLabel)
        hurtingTitleLabel.setUpFirst(view: self, name: "Hurting the War")
        
        var count = 0
        var priviousLabel = hurtingTitleLabel
        
        for each in clan.playerArray {
            let newLabel = manageLabel()
            addSubview(newLabel)
            newLabel.setUp(view: self, topLabel: priviousLabel, name: each.name)
            
            let otherLabel = manageLabel()
            addSubview(otherLabel)
            otherLabel.setUp(view: self, adjacentlabel: newLabel, name: String(each.warDaysNotPlayed))
            priviousLabel = newLabel
            
            count += 1
            if count == 10 {
                break
            }
        }
        
    }
}
