//
//  jsonReader.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 2/9/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation

func loadClan(activeClan: String) -> theClan{
    
    var playerInfoArray:[playerInfo] = []
    var arrayOfWarlogArrays: [[playerWarlog]] = []
    var clanName:String = ""
    
    // makes the array of player objects
    if let clanJson = UserDefaults.standard.object(forKey: activeClan + "myClan") as? [String:Any] {
        clanName = clanJson["name"] as! String
        if let memberList = clanJson["memberList"] as? [[String:Any]] {
            
            for member in memberList {
                if let playerObject = try? playerInfo(json: member) {
                    playerInfoArray.append(playerObject)
                }
            }
        }
    }
    
    var warDates = [String]()
    // makes the array of arrays of warlog objects
    if let warlogJson = UserDefaults.standard.object(forKey: activeClan + "myWarlog") as? [String:Any] {
        if let allWarDayList = warlogJson["items"] as? [[String:Any]] {
            for war in allWarDayList {
                warDates.append(war["createdDate"] as! String)
                var playerWarlogArray:[playerWarlog] = []
                if let participants = war["participants"] as? [[String:Any]] {
                    for participant in participants {
                        if let playerObject = try? playerWarlog(json: participant){
                            playerWarlogArray.append(playerObject)
                        }
                    }
                }
                arrayOfWarlogArrays.append(playerWarlogArray)
            }
        }
    }
    
    // returns the clan
    let clan = theClan(clanTag: activeClan, clanName: clanName, playerInfo: playerInfoArray, playerWarlog: arrayOfWarlogArrays, warDates: warDates) //pass through array of dicts instead of the dates
    return clan
}

/*
// Updates UserDefualt files with the new progress of the clan
func updateClansProgress() {
    if var clansArray = UserDefaults.standard.array(forKey: "myClans") as? [[String: Any]] {
        for clan in clansArray {
            print(clan["tag"] as! String)
            let newClan = loadClan(activeClan: clan["tag"] as! String)
            // Clan Info: eachClan(clanScore, donationsPerWeek, totalTrophies, timeOfLoad) only make another element, if it has been a day/week
            
            // War Info: eachMemberWar(seasonID, collectionBattles, cardsEarned, warDaysPlayed, warDaysMissed, warDaysWon, warDaysInvolvedIn) eachWar(seseaonID, clan total)
            
            var newWarlogArray = [[String:Any]]()
            for eachWar in newClan.warDates {
                let warDate:String = eachWar
                var totalCollectionBattles:Int = 0
                var totalCardsEarned:Int = 0
                var totalWarDaysPlayed:Int = 0
                var totalWarDaysMissed:Int = 0
                var totalWarDaysWon:Int = 0
                var totalWarDaysInvoledIn:Int = 0
                
                for member in newClan.playerArray {
                    // wasen't right
                }
                
                let newDic: [String: Any] = ["warDate": warDate, "totalCollectionBattles": totalCollectionBattles, "totalCardsEarned": totalCardsEarned, "totalWarDaysPlayed": totalWarDaysPlayed, "totalWarDaysMissed": totalWarDaysMissed, "totalWarDaysWon": totalWarDaysWon, "totalWarDaysInvoledIn": totalWarDaysInvoledIn]
                
                newWarlogArray.append(newDic)
            }
            
            if var oldWarlogArray = UserDefaults.standard.array(forKey: "pastWars" + newClan.clanTag) as? [[String:Any]]{
                var counter = 0
                for war in newWarlogArray {
                    // war["warDate"]
                    
                }
                
                
            }else{
                UserDefaults.standard.set(newWarlogArray, forKey: "pastWars" + newClan.clanTag)
            }
        }
    }
}*/

// Function to store total data. When new Clan is saved, create array of dicts with total clan stuff for the past ---. clanScore, donationsPerWeek, total Trophies, timeOfLoad. Also notes the time whe the clan was saved. Only create a new element in the array if a day has gone by. Craft graph that shows this info over time.

// Need to start taking in seasonId for the warlog
// This function will also compare warlog seasonId to each other until it gets a match. When there is no match, will enter stats into an array of dicts with all past war days for the clan up to a certain number.
// We can then use this information to display the progress of the clan.
