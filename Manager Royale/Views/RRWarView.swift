//
//  RRWarView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/15/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRWarView: UIView {
    
    var warIndex = RRInfoLabel()
    var playedWar = RRInfoLabel()
    var playedWarBool = RRInfoLabel()
    var wonWar = RRInfoLabel()
    var wonWarBool = RRInfoLabel()
    var collectionBattles = RRInfoLabel()
    var collectionAmount = RRInfoLabel()
    var cardsEarned = RRInfoLabel()
    var cardsEarnedAmount = RRInfoLabel()
    
    var noParticipation = RRInfoLabel()
    
    
    var viewHeight:CGFloat = 185
    var labelHeight:CGFloat = 35
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(warIndex)
        addSubview(playedWar)
        addSubview(playedWarBool)
        addSubview(wonWar)
        addSubview(wonWarBool)
        addSubview(collectionBattles)
        addSubview(collectionAmount)
        addSubview(cardsEarned)
        addSubview(cardsEarnedAmount)
        addSubview(noParticipation)
        noParticipation.text = "Member Did Not Participate"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(index: Int, war: players.warDay, topAnchor: NSLayoutYAxisAnchor, view: UIView) {
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        if war.collectionBattlesPlayed == 0 {
            backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        } else {
            if war.missedTheWarDay! {
                backgroundColor = UIColor.red.withAlphaComponent(0.1)
            }
            
            if war.wonTheWarDay! {
                backgroundColor = UIColor.green.withAlphaComponent(0.1)
            }
        }
        
        // War Index
        //*********Change to the date of the war*********
        warIndex.setConstraints(topAnchor: self.topAnchor, view: self, sideLeft: true )
        warIndex.setMedium()
        warIndex.text = "War " + String(index)
        
        if war.collectionBattlesPlayed == 0 {
            noParticipation.setConstraints(topAnchor: warIndex.bottomAnchor, view: self, sideLeft: true )
        }else {
            // Played War
            playedWar.setConstraints(topAnchor: warIndex.bottomAnchor, view: self, sideLeft: true )
            playedWar.text = "Played War"
            playedWarBool.setConstraints(topAnchor: warIndex.bottomAnchor, view: self, sideLeft: false )
            playedWarBool.text = String(war.playedTheWarDay)
            
            globalAddLine(leftLabel: playedWar, rightLabel: playedWarBool, view: self)
            
            // Won War
            wonWar.setConstraints(topAnchor: playedWar.bottomAnchor, view: self, sideLeft: true )
            wonWar.text = "Won War"
            wonWarBool.setConstraints(topAnchor: playedWar.bottomAnchor, view: self, sideLeft: false )
            wonWarBool.text = String(war.wonTheWarDay!)
            
            globalAddLine(leftLabel: wonWar, rightLabel: wonWarBool, view: self)
            
            // Collection Battles Played
            collectionBattles.setConstraints(topAnchor: wonWar.bottomAnchor, view: self, sideLeft: true )
            collectionBattles.text = "CollectionBattles"
            collectionAmount.setConstraints(topAnchor: wonWarBool.bottomAnchor, view: self, sideLeft: false )
            collectionAmount.text = String(war.collectionBattlesPlayed)
            
            globalAddLine(leftLabel: collectionBattles, rightLabel: collectionAmount, view: self)
            
            // Cards Collected
            cardsEarned.setConstraints(topAnchor: collectionBattles.bottomAnchor, view: self, sideLeft: true )
            cardsEarned.text = "Cards Earned"
            cardsEarnedAmount.setConstraints(topAnchor: collectionAmount.bottomAnchor, view: self, sideLeft: false )
            cardsEarnedAmount.text = String(war.cardsCollected!)
            
            globalAddLine(leftLabel: cardsEarned, rightLabel: cardsEarnedAmount, view: self)
            
            
            
        }
        
        
    }
}
