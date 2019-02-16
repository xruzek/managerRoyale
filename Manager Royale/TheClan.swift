//
//  TheClan.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 1/22/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation

class players{
    struct warDay{
        var playedTheWarDay:Bool
        var missedTheWarDay:Bool
        var cardsCollected:Int
        var collectionBattlesPlayed:Int
        var wonTheWarDay:Bool
        
        init(playerWarlog:playerWarlog){
            self.missedTheWarDay = false
            if playerWarlog.warDaysPlayed == 0
            {
                self.playedTheWarDay = false
                if(playerWarlog.collectionBattlesPlayed != 0){
                    self.missedTheWarDay = true
                }
            }else{
                self.playedTheWarDay = true
            }
            self.cardsCollected = playerWarlog.cardsEarned
            self.collectionBattlesPlayed = playerWarlog.collectionBattlesPlayed
            if playerWarlog.warDaysWon == 0{
                self.wonTheWarDay = false
            }else{
                self.wonTheWarDay = true
            }
        }
    }
    var warDayArray = [warDay]()  // is in reversed order rn...10th war is numer 0 in the array
    
    var playerTag:String
    var name:String
    var role:String
    var trophies:Int
    var clanRank:Int
    var donations:Int
    var donationsReceived:Int
    
    var cardsEarned:Int
    var warDaysPlayed:Int
    var warDaysWon:Int
    var collectionBattlesPlayed:Int
    
    var warDaysNotPlayed:Int
    var warDayMissedStreak:Int
    var warDaysInvolvedIn:Int
  
    var Worth:Double
    
    // defualt init
    init() throws{
        self.name = "Albert"
        self.role = "member"
        self.trophies = 0
        self.playerTag = ""
        self.clanRank = 0
        self.donations = 0
        self.donationsReceived = 0
        
        self.cardsEarned = 0
        self.warDaysPlayed = 0
        self.warDaysWon = 0
        self.collectionBattlesPlayed = 0
        
        self.warDaysNotPlayed = 0
        self.warDayMissedStreak = 0
        self.warDaysInvolvedIn = 0
        
        self.Worth = 0
    }
    
    // custom init
    init(playerInfo:playerInfo) throws{
        self.name = playerInfo.name
        self.trophies = playerInfo.trophies
        self.playerTag = playerInfo.playerTag
        self.clanRank = playerInfo.clanRank
        self.donations = playerInfo.donations
        self.donationsReceived = playerInfo.donationsReceived
        self.role = playerInfo.role
     
        self.cardsEarned = 0
        self.warDaysPlayed = 0
        self.warDaysWon = 0
        self.collectionBattlesPlayed = 0
        
        self.warDaysNotPlayed = 0
        self.warDayMissedStreak = 0
        self.warDaysInvolvedIn = 0
        
        self.Worth = 0
    }

    // for possible having the total war days in each player object(might just have them reference the clan object) actually no, becasue some people could have not been in the clan for a war day, so it should be per player.
    func calcMissedWarDayStreak(didMiss: Bool){
        if didMiss {
            self.warDayMissedStreak += 1
        }else{
            self.warDayMissedStreak = 0
        }
    }
    
    func calcWarlog(playerWarlog:playerWarlog){
        self.cardsEarned += playerWarlog.cardsEarned
        self.collectionBattlesPlayed += playerWarlog.collectionBattlesPlayed
        self.warDaysInvolvedIn += 1
        
        if playerWarlog.warDaysPlayed == 0{
            self.warDaysNotPlayed += 1
        }else{
            var warDayObject = try! warDay(playerWarlog: playerWarlog)
            warDayArray.append(warDayObject)
            self.warDaysPlayed += playerWarlog.warDaysPlayed
            self.warDaysWon += playerWarlog.warDaysWon
        }
    }
    
    func calcWorth(averageDonations:Double) {
        var newWorth:Double = 0
        
        if self.donations >= Int(averageDonations){
            newWorth += 200
        }else if self.donations >= Int(averageDonations - (averageDonations/2)){
            newWorth += 100
        }else if self.donations != 0{
            newWorth += 50
        }
        
        newWorth += Double(self.warDaysPlayed * 20)
        newWorth += (Double(self.collectionBattlesPlayed)/30) * 200
        newWorth += Double(30 * self.warDaysWon)
        
        if self.warDaysNotPlayed == 0{
            newWorth += 100
           
        }else{
            newWorth -= Double(50 * self.warDaysNotPlayed)
        }
        self.Worth = newWorth
    }
    
}

class theClan {
    let clanName:String
    let clanTag:String
    var playerArray = [players]()
    var totalDonations:Int
    var numOfDonators:Int

    // Extra Variables: (just for curiosity) totalDonationsReceived:Int ???
 
    init() {
        self.clanName = ""
        self.clanTag = ""
        self.totalDonations = 0
        self.numOfDonators = 0
    }
    
    init(clanTag: String, clanName:String, playerInfo: [playerInfo], playerWarlog: [[playerWarlog]])
    {
        self.totalDonations = 0
        self.clanTag = clanTag
        self.numOfDonators = 0
        self.clanName = clanName
        
        for player in playerInfo{
            var playerObject = try! players(playerInfo: player)
            if playerObject.donations != 0{
                self.numOfDonators += 1
            }
            playerArray.append(playerObject)
        }
        
        for player in playerArray{
            self.totalDonations += player.donations
            
            for playerWars in playerWarlog.reversed(){
                var didMiss:Bool = true
                for participant in playerWars{
                    if player.playerTag == participant.playerTag{
                        didMiss = false
                        player.calcWarlog(playerWarlog: participant)
                    }
                }
                player.calcMissedWarDayStreak(didMiss: didMiss)
            }
        }
       
        for player in playerArray{
            player.calcWorth(averageDonations: Double(totalDonations/numOfDonators))
        }
    }
    
    func displayClanNames(){
        print("Total Donations = ", self.totalDonations, "\n")
        print("Average Donations = ", self.totalDonations/self.numOfDonators, "\n")
        for player in self.playerArray{
            print(player.name, "\nDonations = ", player.donations, "\nWar Days not played = ", player.warDaysNotPlayed,"\nWar Days Played = ", player.warDaysPlayed, "\nWar Days Won = ", player.warDaysWon,"\nCollection Days = ", player.collectionBattlesPlayed, "\nW/L Ratio = ", player.warDaysWon, "/",player.warDaysPlayed + player.warDaysNotPlayed, "\nWar Days Missed In A Row = ", player.warDayMissedStreak, "\nWorth is: ",player.Worth, "\n" )
            //print(player.name, "'s Worth is: ", player.Worth, "\n")
        }
    }
    
    func displayInTextView() -> String {
        var textForView:String = ""
        for player in self.playerArray{
            
            textForView += player.name
            textForView += "'s Worth: "
            textForView += String(player.Worth)
            textForView += "\n"
            
        }
        return textForView
    }
    
    func sortArray(sortType:String){
        if sortType == "byDonations"{
            self.playerArray = playerArray.sorted(by: {$0.donations > $1.donations})
        }else if sortType == "byWorth"{
            self.playerArray = playerArray.sorted(by: {$0.Worth > $1.Worth})
        }else if sortType == "byWarDaysWon"{
            self.playerArray = playerArray.sorted(by: {$0.warDaysWon > $1.warDaysWon})
        }else if sortType == "byWarDaysMissedInARow"{
            self.playerArray = playerArray.sorted(by: {$0.warDayMissedStreak > $1.warDayMissedStreak})
        }else if sortType == "byWarDaysNotPlayed"{
            self.playerArray = playerArray.sorted(by: {$0.warDaysNotPlayed > $1.warDaysNotPlayed})
        }else if sortType == "byTrophies"{
            self.playerArray = playerArray.sorted(by: {$0.trophies > $1.trophies})
        }else if sortType == "byCardsEarned"{
            self.playerArray = playerArray.sorted(by: {$0.cardsEarned > $1.cardsEarned})
        }
    }
}


