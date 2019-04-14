//
//  errorHandlingFuncs.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/2/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation

// checks to see if the clan already exists in the clanTag array of clans
func alreadyHaveClan(Tag:String) -> Bool {
    // for each loop, if found one, set that one to active, display message, and return true
    if let clansArray = UserDefaults.standard.array(forKey: "myClans") as? [String] {
        for clan in clansArray {
            if clan == Tag {
                return true
            }
        }
        return false
    }else {
        let emptyClans = [String]()
        UserDefaults.standard.set(emptyClans, forKey: "myClans")
        return false
    }
}

// adds the new clan to the array
func addToClansArray (clanTag: String) {
    var newArray = UserDefaults.standard.object(forKey: "myClans") as? [String]
    newArray?.append(clanTag)
    UserDefaults.standard.set(newArray, forKey: "myClans")
    
    let newMemberDicArray = [[String:Any]]()
    UserDefaults.standard.set(newMemberDicArray, forKey: clanTag + "members")
}

// updates the array of members if needed
func updateMembersArray (newClan: theClan, newDic: [String:Any], member: players) -> [[String:Any]] {
    
    var newMemberBattleLogArray = UserDefaults.standard.object(forKey: newClan.clanTag + "members") as! [[String:Any]]
    var isIn = false
    var arrayIndex = 0
    for oldMember in newMemberBattleLogArray {
        if oldMember["tag"] as! String == member.playerTag {
            
            isIn = true
            let updatingDic:[String:Any] = ["name": oldMember["name"] as! String, "dateDiscovered": oldMember["dateDiscovered"] as! Date, "tag": oldMember["tag"] as! String, "timeSincePlayed": newDic["timeSincePlayed"] as! Int]
            
            // Update that member at the array index
            newMemberBattleLogArray[arrayIndex] = updatingDic
            print("Updated: ", member.name, newDic["timeSincePlayed"] as! Int, "From: ", oldMember["timeSincePlayed"] as! Int)
            break
        }
        arrayIndex += 1
    }
    if !isIn {
        // add the new member to the array
        //print("---------NEW MEMBER------------")
        let newMemberDic:[String:Any] = ["name": newDic["name"] as! String, "dateDiscovered": newDic["dateDiscovered"] as! Date, "tag": newDic["tag"] as! String, "timeSincePlayed": newDic["timeSincePlayed"] as! Int]
        newMemberBattleLogArray.append(newMemberDic)
        print("added member: ", newMemberDic["name"] as! String)
    }
    return newMemberBattleLogArray
}



// delete selected clan
func deleteClan(clanTag: String) {
    UserDefaults.standard.removeObject(forKey: "activeClan")
    UserDefaults.standard.removeObject(forKey: clanTag + "members")
    UserDefaults.standard.removeObject(forKey: clanTag + "myWarlog")
    UserDefaults.standard.removeObject(forKey: clanTag + "myClan")
    var clanArray = UserDefaults.standard.object(forKey: "myClans") as! [String]
    var index = 0
    for each in clanArray {
        if each == clanTag {
            clanArray.remove(at: index)
        }
        index += 1
    }
  UserDefaults.standard.set(clanArray, forKey: "myClans")
    
}

// presents the nest view when program is done loading clans
func presentNextView() {
   
    firstScreen.present(mainScreen, animated: false, completion: nil)
}

// returns how many days its been since the string date
func calcTime(time:String) -> Int {
    
    let index = time.firstIndex(of: "T") ?? time.endIndex
    var newDate = time[..<index]
    newDate.insert("/", at: newDate.index(newDate.startIndex, offsetBy: 4))
    newDate.insert("/", at: newDate.index(newDate.startIndex, offsetBy: 7))
    
    let formatter = DateFormatter()
    //formatter.dateFormat = "dd/MM/yyyy"
    formatter.dateFormat = "yyyy/MM/dd"
    let theDate = formatter.date(from: String(newDate))
    let today = Date()
    var diff = today.timeIntervalSince(theDate!)
    /*
     diff /= 60
     diff /= 60
     diff /= 24
     */
    diff /= 86400
    
    return Int(diff)
}
