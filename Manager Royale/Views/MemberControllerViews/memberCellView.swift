//
//  memberCellView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/31/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberCellView: UIView {
    // Name view Labels
    var indexLabel = memberCellLabel()
    var nameLabel = memberCellLabel()
    var roleLabel = memberCellLabel()
    var trophyLabel = memberCellLabel()
    
    // War view labels
    var winsLabel = memberCellLabel()
    var playedLabel = memberCellLabel()
    var missedLabel = memberCellLabel()
    var cardsEarnedLabel = memberCellLabel()
    
    var mutWinsLabel = memberCellLabel()
    var mutPlayedLabel = memberCellLabel()
    var mutMissedLabel = memberCellLabel()
    var mutCardsEarnedLabel = memberCellLabel()
    
    // Donation View lables
    var givenLabel = memberCellLabel()
    var recievedLabel = memberCellLabel()
    var lastPlayedLabel = memberCellLabel()
    var clarificationLabel = memberCellLabel()
    
    var mutGivenLabel = memberCellLabel()
    var mutRecievedLabel = memberCellLabel()
    var mutLastPlayeLabel = memberCellLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setColor(index: Int) -> UIColor {
        // pass in index if its the war view
        // pass through index + 100 if its the donation view
        
        if index > 99{  // Donation
            
        } else {        // War
            
        }
        
        
        let num = Int.random(in: 0..<4)
        if num == 0 {
            return .gray
        } else if num == 1{
            return .yellow
        } else if num == 2 {
            return .green
        } else {
            return .red
        }
        
    }
    
    
    
    // funciton for if the view is the furthest to the left of the cell
    // sets up: count, name, role, trophie image, trophies
    func setUpNameView(view: memberCell, index: Int) {
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        // check if player is inactive, if so, set color and maybe display a label
        
        // contraints
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width/2).isActive = true
        
        // Set up labels
        addSubview(indexLabel)
        indexLabel.setUpIndex(view: self, index: index)
        
        addSubview(nameLabel)
        nameLabel.setUpCellLabel(view: self, leftLabel: indexLabel, index: index)
        
        addSubview(roleLabel)
        roleLabel.setUpRole(view: self, leftLabel: indexLabel, topLabel: nameLabel, index: index)
        
        addSubview(trophyLabel)
        trophyLabel.setUpTrophy(view: self, leftLabel: indexLabel, topLabel: roleLabel, index: index)
        
    }
    
    
    
    // sets up the view in the middle
    // sets up: won, wonAmount, played, playedAmount, missed, missed amount, cards earned, cardsEarnedAmount
    func setUpWarView(view: memberCell, index: Int, leftView: UIView, rightView: UIView) {
        layer.borderWidth = 5
        layer.borderColor = setColor(index: index).cgColor
        
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: leftView.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: rightView.leftAnchor).isActive = true
        
        // Labels
        addSubview(winsLabel)
        winsLabel.setUpDescriptiveWar(view: self, index: index, newText: "Wins")
        addSubview(mutWinsLabel)
        mutWinsLabel.setUpChangingWarLabels(view: self, adjacentLabel: winsLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].warDaysWon))
        
        addSubview(playedLabel)
        playedLabel.setUpDescriptiveWar(view: self, topLabel: winsLabel, index: index, newText: "Played")
        addSubview(mutPlayedLabel)
        mutPlayedLabel.setUpChangingWarLabels(view: self, adjacentLabel: playedLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].warDaysPlayed))
        
        addSubview(missedLabel)
        missedLabel.setUpDescriptiveWar(view: self, topLabel: playedLabel, index: index, newText: "Missed")
        addSubview(mutMissedLabel)
        mutMissedLabel.setUpChangingWarLabels(view: self, adjacentLabel: missedLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].warDaysNotPlayed))
        
        addSubview(cardsEarnedLabel)
        cardsEarnedLabel.setUpDescriptiveWar(view: self, topLabel: missedLabel, index: index, newText: "Cards Earned")
        addSubview(mutCardsEarnedLabel)
        mutCardsEarnedLabel.setUpChangingWarLabels(view: self, adjacentLabel: cardsEarnedLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].cardsEarned))
        
        
    }
    
    // sets up the dontaions view
    // sets up: given, givenAmount, Recieved, recievedAmount, lastPlayed, lastPlayedAmount
    func setUpDonationsView(view: memberCell, index: Int) {
        layer.borderWidth = 5
        layer.borderColor = setColor(index: index).cgColor
        
        translatesAutoresizingMaskIntoConstraints = false
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width/3).isActive = true
        
        addSubview(givenLabel)
        givenLabel.setUpDescriptiveWar(view: self, index: index, newText: "Given")
        addSubview(mutGivenLabel)
        mutGivenLabel.setUpChangingWarLabels(view: self, adjacentLabel: givenLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].donations))
        
        addSubview(recievedLabel)
        recievedLabel.setUpDescriptiveWar(view: self, topLabel: givenLabel, index: index, newText: "Recieved")
        addSubview(mutRecievedLabel)
        mutRecievedLabel.setUpChangingWarLabels(view: self, adjacentLabel: recievedLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].donationsReceived))
        
        addSubview(lastPlayedLabel)
        lastPlayedLabel.setUpDescriptiveWar(view: self, topLabel: recievedLabel, index: index, newText: "Last Played")
        addSubview(mutLastPlayeLabel)
        mutLastPlayeLabel.setUpChangingWarLabels(view: self, adjacentLabel: lastPlayedLabel, index: index, newText: String(GlobalVariables.activeClan.playerArray[index].timeSinceLastBattle!))
        
        addSubview(clarificationLabel)
        clarificationLabel.setUpDescriptiveWar(view: self, topLabel: lastPlayedLabel, index: index, newText: "(In Days)")
        clarificationLabel.textAlignment = .center
    }
    
}
