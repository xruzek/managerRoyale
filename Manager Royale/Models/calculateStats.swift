//
//  calculateStats.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 2/18/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation
/*
 Variables available:
 Clan:
 - Donation Average (Total Donations this week, num of donators)
 - Total Trophies
 - War Trophies
 - totalMembers
 - Total War Stats (WarDaysWon, CollectionBattles, CardsCollected, WarDaysMissed, WarDaysPlayed, WarDaysInvoledIn)
 Member:
 - Trophies
 - Donations (weekly)
 - DonationsReceived
 - War Stats (WarDaysWon, CollectionBattles, CardsCollected, WarDaysMissed, WarDaysPlayed, WarDaysInvolvedIn)
 - timeSincePlayed
 - dateDiscovered
 */

// calculates how that member is doing compared to the clan
func calcColors(clan: theClan, member: players) ->String {
    var memberColor:String = ""
    
    return memberColor
}

func changeClanMemberWorth (clan: theClan, donationWeight: Double, activityWeight: Double, warWeight: Double) -> theClan{ // returns the standard of the clan.
    // var activityScore:Double // ***^X^***
    
    // Weight variables are between 0.0 && 1
                                   // Defualt Weighting:
      // 0   : 0.0
    
    for member in clan.playerArray {
        var warWorth:Double = 0        // 700 : 0.7
        var donationsWorth:Double = 0  // 300 : 0.3
        let activityWorth:Double = 0
        
        warWorth += Double(member.warDaysPlayed * 20)
        warWorth += (Double(member.collectionBattlesPlayed)/30) * 200
        warWorth += Double(30 * member.warDaysWon)
        if member.warDaysNotPlayed == 0{
            warWorth += 100
            
        }else{
            warWorth -= Double(50 * member.warDaysNotPlayed)
        }
        
        donationsWorth += Double(member.donations - member.donationsReceived) * 2
        
        warWorth *= warWeight
        donationsWorth *= donationWeight
        
        member.Worth = warWorth + donationsWorth + activityWorth
    }
    
    // Figure out what happens when clan has no past Wars
    
    return clan
}

/*
 if clan.totalWarDaysInvolvedIn < 3 && clan.totalWarDaysInvolvedIn > 0 {     // Not many wars
 // Some weighting on activity && a lot of weighting on donations vs donations recieved
 
 } else if clan.totalWarDaysInvolvedIn == 0 {                                // No wars at all
 // a lot of wieghting on activity/increase in trophies && donations vs donations recieved
 
 } else {                                                                    // Does the war
 // Normal wieghting on donaitons, war stats, and none on activity.
 }
 
 }*/



func manageMembers (clan: theClan, order: String) ->[String] { // takes in wether or not to return array of who to premote/demote/kick(maybe also a reason):String

    var memberArray = [String] ()
    clan.sortArray(sortType: "byWorth")
    
    if ( order == "kick" ) {
        
    }
    
    if ( order == "premote" ) {
        
    }
    
    return memberArray
}

