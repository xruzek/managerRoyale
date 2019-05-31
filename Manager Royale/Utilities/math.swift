//
//  math.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 5/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation


struct mathVariables {
    
    // color variables
    static var avgWarWin: Double = 0
    
    static var SDWarWin: Double = 0
    
}


// average/STD calc fucntion
func calcAverages () {
    calcWarWinPercent()
    
    
    
}

// calculates avg & SD for war win percentage
func calcWarWinPercent()
{
    let clan = GlobalVariables.activeClan
    var totalWarWins = 0.0
    var totalMembers = 0
    
    // Avg Formula
    for member in clan.playerArray {
        if member.warDaysInvolvedIn != 0 {
            totalWarWins += member.winPercent!
            totalMembers += 1
            
        }
        
    }
    mathVariables.avgWarWin = totalWarWins/Double(totalMembers)
    
    // SD Formula
    var SDVar = 0.0
    for member in clan.playerArray {
        SDVar += (member.winPercent! - mathVariables.avgWarWin) * (member.winPercent! - mathVariables.avgWarWin)
    }
    SDVar = SDVar * 1/(Double(totalMembers) - 1)
    SDVar = sqrt(SDVar)
    mathVariables.SDWarWin = SDVar
}
