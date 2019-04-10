//
//  calculateStats.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 2/18/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation
import UIKit
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

func setWarColor(clan: theClan, member: players) -> UIColor {
    var num:Int = 90
    
    for thingy in clan.playerArray {
        print(thingy.name)
    }
    
    
    
    return .gray
}






