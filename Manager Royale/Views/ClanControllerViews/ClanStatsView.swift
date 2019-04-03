//
//  ClanStatsView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class ClanStatsView: UIView {
    // Labels that don't change
    var clanScore = DescriptiveLables()
    var donationLabel = DescriptiveLables()
    var averageTrophies = DescriptiveLables()
    var warTrophies = DescriptiveLables()
    var averageWarDayWins = DescriptiveLables()
    var averageCardsCollected = DescriptiveLables()
    
    // Labels that do change
    var mutClanScore = DescriptiveLables()
    var mutDonationLabel = DescriptiveLables()
    var mutAverageTrophies = DescriptiveLables()
    var mutWarTrophies = DescriptiveLables()
    var mutAverageWarDayWins = DescriptiveLables()
    var mutAverageCardsCollected = DescriptiveLables()
    
    var viewHeight = 0.0
    var viewWidth = 0.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(view: UIView) {
        backgroundColor = Colors.rexGray.withAlphaComponent(0.2)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: view.frame.size.height/1.4).isActive = true
        
        self.viewHeight = Double(view.frame.size.height/1.4)
        self.viewHeight -= 420
        self.viewHeight /= 7
       
        self.viewWidth = Double(view.frame.size.width)
        addLabels()
        
    }
    
    func addLabels() {
        
        // Adds labels that say what the clan stat is
        self.addSubview(clanScore)
        clanScore.setUpLabel(newText: "Clan Score", height: viewHeight, width: viewWidth, view: self)
        self.addSubview(mutClanScore)
        mutClanScore.setUpLabel(newText: String(GlobalVariables.activeClan.clanScore), width: viewWidth, adjacentLabel: clanScore, view: self)
        
        self.addSubview(donationLabel)
        donationLabel.setUpLabel(newText: "Donations/Week", height: viewHeight, width: viewWidth, view: self, otherDL: clanScore)
        self.addSubview(mutDonationLabel)
        mutDonationLabel.setUpLabel(newText: String(GlobalVariables.activeClan.totalDonations), width: viewWidth, adjacentLabel: donationLabel, view: self)
        
        
        self.addSubview(averageTrophies)
        averageTrophies.setUpLabel(newText: "Average Trophies", height: viewHeight, width: viewWidth, view: self, otherDL: donationLabel)
        self.addSubview(mutAverageTrophies)
        mutAverageTrophies.setUpLabel(newText: String(Int(Double(GlobalVariables.activeClan.totalTrophies/GlobalVariables.activeClan.totalMembers))), width: viewWidth, adjacentLabel: averageTrophies, view: self)
        
        self.addSubview(warTrophies)
        warTrophies.setUpLabel(newText: "War Trophies", height: viewHeight, width: viewWidth, view: self, otherDL: averageTrophies)
        self.addSubview(mutWarTrophies)
        mutWarTrophies.setUpLabel(newText: String(GlobalVariables.activeClan.clanWarTrophies), width: viewWidth, adjacentLabel: warTrophies, view: self)
        
        self.addSubview(averageWarDayWins)
        averageWarDayWins.setUpLabel(newText: "Average War Day Wins", height: viewHeight, width: viewWidth, view: self, otherDL: warTrophies)
        self.addSubview(mutAverageWarDayWins)
        mutAverageWarDayWins.setUpLabel(newText: String(GlobalVariables.activeClan.totalWarDayWins), width: viewWidth, adjacentLabel: averageWarDayWins, view: self)
        
        self.addSubview(averageCardsCollected)
        averageCardsCollected.setUpLabel(newText: "Average Cards Collected", height: viewHeight, width: viewWidth, view: self, otherDL: averageWarDayWins)
        self.addSubview(mutAverageCardsCollected)
        mutAverageCardsCollected.setUpLabel(newText: String(GlobalVariables.activeClan.totalCardsCollected), width: viewWidth, adjacentLabel: averageCardsCollected, view: self)
    }

}
