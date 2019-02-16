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
        print("Clan name = ", clanName)
        if let memberList = clanJson["memberList"] as? [[String:Any]] {
            
            for member in memberList {
                if let playerObject = try? playerInfo(json: member) {
                    playerInfoArray.append(playerObject)
                }
            }
        }
    }
    
    // makes the array of arrays of warlog objects
    if let warlogJson = UserDefaults.standard.object(forKey: activeClan + "myWarlog") as? [String:Any] {
        if let allWarDayList = warlogJson["items"] as? [[String:Any]] {
    
            for war in allWarDayList {
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
    let clan = theClan(clanTag: activeClan, clanName: clanName, playerInfo: playerInfoArray, playerWarlog: arrayOfWarlogArrays)
    return clan
}

// Function to store total data. When new Clan is saved, create array of dicts with total clan stuff for the past ---. clanScore, donationsPerWeek, total Trophies, timeOfLoad. Also notes the time whe the clan was saved. Only create a new element in the array if a day has gone by. Craft graph that shows this info over time.

// Need to start taking in seasonId for the warlog
// This function will also compare warlog seasonId to each other until it gets a match. When there is no match, will enter stats into an array of dicts with all past war days for the clan up to a certain number.
// We can then use this information to display the progress of the clan.
