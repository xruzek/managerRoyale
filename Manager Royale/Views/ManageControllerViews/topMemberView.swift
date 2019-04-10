//
//  topMemberView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/2/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class topMemberView: UIView {
    var topMembersLabel = rexTitleLabel()
    
    var mostWarDaysWon = rexTitleLabel()
    var warDaysWonMember = manageLabel()
    var warDaysWonAmount = manageLabel()
    
    var mostCardsCollected = rexTitleLabel()
    var cardsCollectedMember = manageLabel()
    var cardsCollectedAmount = manageLabel()
    
    var mostGenerous = rexTitleLabel()
    var generousMember = manageLabel()
    var generousAmount = manageLabel()
    
    var clan = GlobalVariables.activeClan
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(view: UIView, topView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.tabBarHeight).isActive = true
        
        backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        
        addLabels()
    }
    
    func addLabels() {
        addSubview(topMembersLabel)
        topMembersLabel.setUp(view: self, name: "Top Members")
        topMembersLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        // Most War days won
        clan.sortArray(sortType: "War Days Won")
        addSubview(mostWarDaysWon)
        mostWarDaysWon.setUp(view: self, name: " Most War Days Won")
        mostWarDaysWon.topAnchor.constraint(equalTo: topMembersLabel.bottomAnchor, constant: 10).isActive = true
        mostWarDaysWon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mostWarDaysWon.font = mostWarDaysWon.font.withSize(20)
        
        addSubview(warDaysWonMember)
        warDaysWonMember.setUp(view: self, topLabel: mostWarDaysWon, name: clan.playerArray[0].name)
        addSubview(warDaysWonAmount)
        warDaysWonAmount.setUp(view: self, adjacentlabel: warDaysWonMember, name: String(clan.playerArray[0].warDaysWon) + " Wins")
        
        // Most Cards Collected
        clan.sortArray(sortType: "Cards Collected")
        addSubview(mostCardsCollected)
        mostCardsCollected.setUp(view: self, name: " Most Cards Collected")
        mostCardsCollected.topAnchor.constraint(equalTo: warDaysWonMember.bottomAnchor, constant: 10).isActive = true
        mostCardsCollected.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mostCardsCollected.font = mostCardsCollected.font.withSize(20)
        
        addSubview(cardsCollectedMember)
        cardsCollectedMember.setUp(view: self, topLabel: mostCardsCollected, name: clan.playerArray[0].name)
        addSubview(cardsCollectedAmount)
        cardsCollectedAmount.setUp(view: self, adjacentlabel: cardsCollectedMember, name: String(clan.playerArray[0].cardsEarned))
        
        
        // Most Generous
        clan.sortArray(sortType: "Most Generous")
        addSubview(mostGenerous)
        mostGenerous.setUp(view: self, name: " Most Generous")
        mostGenerous.topAnchor.constraint(equalTo: cardsCollectedMember.bottomAnchor, constant: 10).isActive = true
        mostGenerous.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mostGenerous.font = mostCardsCollected.font.withSize(20)
        
        addSubview(generousMember)
        generousMember.setUp(view: self, topLabel: mostGenerous, name: clan.playerArray[0].name)
        addSubview(generousAmount)
        generousAmount.setUp(view: self, adjacentlabel: generousMember, name: String(clan.playerArray[0].donations))
    }
    
}
