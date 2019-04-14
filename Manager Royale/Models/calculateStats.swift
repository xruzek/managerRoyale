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
func calcColors(clan: theClan, member: players) -> String {
    var memberColor:String = ""
    
    return memberColor
}

// set color of the member
func setMemberColor(clan: theClan, member: players) -> UIColor {
    var memberColor: UIColor = .white
    let mt = member.timeInClan! / 24
    var isHurting = false
    
    let hurtArr = hurtingClanMembers(clan: clan)
    for player in hurtArr {
        if player.playerTag == member.playerTag {
            isHurting = true
        }
    }
    
    //if Int(mt) > 3 {
        if member.timeSinceLastBattle! > 7 { // if member is inactive for more than a week, return gray
            memberColor = .gray
        } else {
            if member.winPercent! >= 50 {
                memberColor = .green
            } else if isHurting{
                memberColor = .red
            } else {
                memberColor = .yellow
            }
        }
    //} // if member hasn't been in the clan for 3 days, his field remains white
    return memberColor
}

func setWarColor(clan: theClan, member: players) -> UIColor {
    var num:Int = 90
    var otherNum = 80
    let color:UIColor = UIColor.red
    
    for thingy in clan.playerArray {
        print(thingy.name)
    }
    
    return color
}


// returns inactive members of a clan based on the days parameter
func inactiveMembers(clan: theClan, days: Int) -> [players] {
    var inactiveMembers = [players]()
    for member in clan.playerArray {
        if member.timeSinceLastBattle! > days {
            inactiveMembers.append(member)
        }
    }
    // for testing
    for each in inactiveMembers {
        print(each.name)
        print("War Days Played: ", each.warDaysPlayed)
        print("Time In Clan:    ", Int(each.timeInClan!))
        print("Days Inactive:   ", each.timeSinceLastBattle!)
        print()
    }
    return inactiveMembers
}

// returns members that don't participate in the war based on how long they've been in the clan
func inactiveWarMembers(clan: theClan, days: Int) -> [players] {
    var inactiveMembers = [players]()
    for member in clan.playerArray {
        let m = member.timeInClan! / 24   // makes the varibale be in days
        if Int(m) >= days {
            if member.warDayMissedStreak == 10 {
                inactiveMembers.append(member)
            }
        }
    }
    // for testing
    for each in inactiveMembers {
        print(each.name)
        print("War Days Played: ", each.warDaysPlayed)
        print("Time In Clan:    ", Int(each.timeInClan!))
        print("Days Inactive:   ", each.timeSinceLastBattle!)
        print()
    }
    return inactiveMembers
}

// returns who does bad in the clan
func hurtingClanMembers(clan: theClan) -> [players] {
    var hurtClan = [players]()
    
    for member in clan.playerArray {
        var num:Int = 0
        
        num += member.warDaysInvolvedIn - member.warDaysWon
        
        if member.warDaysWon < num {
            
            if member.warDaysInvolvedIn > 4 {  // has been in at least 5 war days
                if member.winPercent! <= 20 {
                    hurtClan.append(member)
                } // if member has won less than 20% of their battles, append em
                
            } else if member.warDaysNotPlayed > 2 {
                if (member.collectionBattlesPlayed - member.collectionBattelsMissed) < 0 {
                    hurtClan.append(member)
                } // append if member has missed more collection battels than compleated
            } // if member has missed 3 or more war battles
            
            
        } // if war days won is < war days lost
    } // for loop
    
    return hurtClan
}




