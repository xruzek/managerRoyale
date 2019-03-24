//
//  mostViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/4/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class mostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //--------Label outlets--------
    // Most War Days
    
    // Most Cards Collected
    
    // Most Generous
    
    // Most Worthy
    
    //--------Full Clan outlets--------
    // Inactive
    
    // Hurting war score
    
    // Who to kick
    
    
    // fills the top member lables with the correct members
    func fillTopMemberLabels() {
        
    }
    
    // fills the Inactive memebrs and the Hurting war score sections
    func fillInactiveAndHurtingWar() {
        
    }
    
    // fills the section that tells the user who to kick
    func fillWhoToKick() {
        var kickArray: [String:Any] = recommendMembersToKick()
        
        
        
    }
    
    
    
    // algorithm that returns an array of string/dics of people to kick
    func recommendMembersToKick() -> [String:Any] {
        var kickArray:[String:Any] = [:]
        
        if let activeClan = UserDefaults.standard.object(forKey: "activeClan") as? String{
            var newClan = theClan()
            newClan = loadClan(activeClan: activeClan)
            
           
            
            
            
            
            
        }
        return kickArray
    }
}
