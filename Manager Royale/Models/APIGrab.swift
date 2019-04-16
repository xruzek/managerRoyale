//
//  testMyAPI.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 2/11/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation




/*// This function grabs the war info and saves it to the UserDefualts
func myAPIClanGrab (withLocation clanTag:String, completion: @escaping (String) -> ())
{
    //UserDefaults.standard.removeObject( forKey: clanTag + "myClan")
    //UserDefaults.standard.removeObject( forKey:  "activeClan")
    //UserDefaults.standard.removeObject( forKey:  clanTag + "myWarlog")
    
    var didWork = "api.clashroyale.com worked"
    let headers = [
        "Authorization": "Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImVkNWI3MTg2LTQ1ZTMtNDQ1Zi1iNjU0LWI5ZGYyMTA3NGEwMiIsImlhdCI6MTU1NDMxMzU5OCwic3ViIjoiZGV2ZWxvcGVyLzNmMDgyYmI0LTc4OTAtMjc1Yi1lNTFiLThjODViZGRkMDc5OSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxMzQuMjA5LjIyMi42MiJdLCJ0eXBlIjoiY2xpZW50In1dfQ.OUq5FzKrMwaJQpoe9922CMKWbYyiDuZt9IgGnnXFNXet4kyBB3cAry-OJf8Vni6dR9JZ8tuL8BBlRdxF_M5NAA",
        "Content-Type": "application/json",
        ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.clashroyale.com/v1/clans/%23" + clanTag)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    //let session = URLSession.shared
    let config = URLSessionConfiguration.default
    config.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
    config.connectionProxyDictionary = [AnyHashable: Any]()
    config.connectionProxyDictionary?["kCFNetworkProxiesHTTPSEnable"] = 1
    config.connectionProxyDictionary?["kCFNetworkProxiesHTTPSProxy"] = "134.209.222.62"
    config.connectionProxyDictionary?["kCFNetworkProxiesHTTPSPort"] = 3128
    config.connectionProxyDictionary?["kCFNetworkProxiesHTTPEnable"] = 1
    config.connectionProxyDictionary?["kCFNetworkProxiesHTTPProxy"] = "134.209.222.62"
    config.connectionProxyDictionary?["kCFNetworkProxiesHTTPPort"] = 3128
    let session = URLSession.init(configuration: config, delegate: nil, delegateQueue: OperationQueue.current)
    
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if error != nil {
            
            print("Client-side error in myAPIClanGrab: \(String(describing: error))")
            //completion(nil)
            return
        }
        
        if let data = data {  // if the data id found
            do {  // try and serialize the data into a dictionary
                //print(response!)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    print(json)
                    // if the program has trouble reading in from the API
                    if let reason = json["reason"] as? String{
                        if(reason == "accessDenied"){
                            print("wrong API key")
                            didWork = "wrongKey"
                        }
                        if(reason == "notFound"){
                            print("The clan tag was wrong")
                            didWork = "wrongTag"
                            // display message for user
                            // make it return a string that says what the error is
                        }
                    } else {
                        print("Setting user defaults")
                        UserDefaults.standard.set(json, forKey: clanTag + "myClan")
                        UserDefaults.standard.set(clanTag, forKey: "activeClan")
                        print(json)
                    }
                }
            }catch {  // if it doesn't work, print the error
                print(error.localizedDescription)
                didWork = "local"
            }
            completion(didWork)
        }else{
            didWork = "serverDown"
            completion(didWork)
        }
    })
    dataTask.resume()
}*/






// This function grabs the war info and saves it to the UserDefualts
func myAPIClanGrab (withLocation clanTag:String, completion: @escaping (String) -> ())
{
    var didWork = "worked"
    let headers = [
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjljYjhkMjdhLTE2OWQtNDUyOC04ZmMzLTk4MDdkMTJhNGU1MSIsImlhdCI6MTU0Nzg0OTQxNiwic3ViIjoiZGV2ZWxvcGVyLzNmMDgyYmI0LTc4OTAtMjc1Yi1lNTFiLThjODViZGRkMDc5OSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxNzQuMTAwLjgzLjEwIl0sInR5cGUiOiJjbGllbnQifV19.Zfj86o_AG4zYWEAcbz7SsfpmpjZcveORdWMNhEDO-ix23hZSpMvnAbkHE1oS1yopr6-M7juvtF20_ZTCR6k35A",
        "Cache-Control": "no-cache",
        ]

    let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:5000/clanGrab/" + clanTag)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let data = data {  // if the data id found
            do {  // try and serialize the data into a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    // if the program has trouble reading in from the API
                    if let reason = json["reason"] as? String{
                        if(reason == "accessDenied"){
                            print("wrong API key")
                            didWork = "wrongKey"
                        }
                        if(reason == "notFound"){
                            print("The clan tag was wrong")
                            didWork = "wrongTag"
                            // display message for user
                            // make it return a string that says what the error is
                        }
                    } else {
                        UserDefaults.standard.set(json, forKey: clanTag + "myClan")
                        UserDefaults.standard.set(Date(), forKey: clanTag + "lastUpdated")
                        UserDefaults.standard.set(clanTag, forKey: "activeClan")
                    }
                }
            }catch {  // if it doesn't work, print the error
                print(error.localizedDescription)
                didWork = "local"
            }
            completion(didWork)
        }else{
            didWork = "serverDown"
            completion(didWork)
        }
    })
    dataTask.resume()
}

// This function grabs the war info and saves it to the UserDefualts
func myAPIWarlogGrab (withLocation clanTag:String, completion: @escaping (String) -> ())
{
    var didWork = "worked"
    let headers = [
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjljYjhkMjdhLTE2OWQtNDUyOC04ZmMzLTk4MDdkMTJhNGU1MSIsImlhdCI6MTU0Nzg0OTQxNiwic3ViIjoiZGV2ZWxvcGVyLzNmMDgyYmI0LTc4OTAtMjc1Yi1lNTFiLThjODViZGRkMDc5OSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxNzQuMTAwLjgzLjEwIl0sInR5cGUiOiJjbGllbnQifV19.Zfj86o_AG4zYWEAcbz7SsfpmpjZcveORdWMNhEDO-ix23hZSpMvnAbkHE1oS1yopr6-M7juvtF20_ZTCR6k35A",
        "Cache-Control": "no-cache",
        ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:5000/warlogGrab/" + clanTag)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    //request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        
        
        if let data = data {  // if the data id found
            
            do {  // try and serialize the data into a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    // if the program has trouble reading in from the API
                    if let reason = json["reason"] as? String{
                        if(reason == "accessDenied"){
                            print("wrong API key")
                            didWork = "wrongKey"
                        }
                        if(reason == "notFound"){
                            print("The clan tag was wrong")
                            didWork = "wrongTag"
                            // display message for user
                            // make it return a string that says what the error is
                        }
                    } else {
                        UserDefaults.standard.set(json, forKey: clanTag + "myWarlog")
                    }
                }
            }catch {  // if it doesn't work, print the error
                print(error.localizedDescription)
                didWork = "readJsonWrong"
            }
            completion(didWork)
        }else{
            didWork = "serverDown"
            completion(didWork)
        }
    })
    dataTask.resume()
}

// This functions grabs the battle log and returns a Dictionary with :["name", "dateDiscovered", "tag", "timeSincePlayed"]
func updateMemberList (withLocation member:players, completion: @escaping ([String:Any]) -> ()) {
    var newDic: [String:Any] = ["tag": "", "timeSincePlayed": 0, "dateDiscovered": Date(), "name": member.name, "lastUpdated": Date()]
    var newTimeSincePlayed:String = "20190326T060653.000Z"
    var battleLogDoesNotShowNew = true
    
    let request = NSMutableURLRequest(url: NSURL(string: "http://127.0.0.1:5000/memberGrab/" + member.playerTag.replacingOccurrences(of: "#", with: ""))! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let data = data {  // if the data id found
            do {  // try and serialize the data into a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                    // This where all those for/if let loops will go
                    var counter = 1
                    
                    if json.isEmpty {
                        print(json)
                        let noBatDic: [String:Any] = ["tag": member.playerTag, "timeSincePlayed": -1, "dateDiscovered": Date(), "name": member.name, "lastUpdated": Date()]
                        completion(noBatDic)
                    } else {
                        newTimeSincePlayed = json[0]["battleTime"] as! String
                    }
                    
                    
                    for match in json {
                        if let battleTime = match["battleTime"] as? String {
                            
                            if let team = match["team"] as? [[String:Any]] {
                                for item in team {
                                    let testPlayerTag = item["tag"] as! String
                                    if testPlayerTag == member.playerTag {
                                        if let clan = item["clan"] as? [String:Any] {
                                            if let clanTag = clan["tag"] as? String {
                                                
                                                // try and calculate when they joined the clan
                                                if clanTag != member.clanTag {
                                                    // check battle time - currentTime, manipulate battleLogDoesNotShowNew
                                                    if calcTime(time: battleTime) > 3 {
                                                        battleLogDoesNotShowNew = false
                                                    }
                                                }
                                            }
                                            counter += 1
                                        } else {
                                            // check battle time - currentTime, manipulate battleLogDoesNotShowNew
                                            if calcTime(time: battleTime) > 3 {
                                                battleLogDoesNotShowNew = false
                                            }
                                            
                                            counter += 1
                                        }
                                    }
                                }
                            }
                        }
                    }
                    let calculatedTimeSincePlayed = calcTime(time: newTimeSincePlayed)
                    newDic["timeSincePlayed"] = calculatedTimeSincePlayed
                    newDic["tag"] = member.playerTag
                    newDic = ["name": member.name, "dateDiscovered": Date(), "tag": member.playerTag, "timeSincePlayed": calculatedTimeSincePlayed, "lastUpdated": Date()]
                }
            }catch {  // if it doesn't work, print the error
                print(error.localizedDescription)
            }
            completion(newDic)
        } else {
            print("in the else")
            completion(newDic)
        }
    })
    dataTask.resume()
}

// Refreshes the data from the API
func refreshClanInfo (withLocation clanTag: String, completion: @escaping (String) -> ()) {
    // add ad here
    
    myAPIWarlogGrab(withLocation: clanTag) { (didWorkAswell: String) in
        myAPIClanGrab(withLocation: clanTag) { (didWork: String) in
            
            var newClan = theClan()
            newClan = loadClan(activeClan: clanTag)
            var newTags = filterMemberList(clan: newClan)
            
            var count = 0
            for member in newClan.playerArray {
                updateMemberList(withLocation: member) { (newDic: [String:Any]) in
                    count += 1
                    let newMemberBattleLogArray = updateMembersArray(newClan: newClan, newDic: newDic, member: member)
                   
                    // Update the UserDefault
                    UserDefaults.standard.set(newMemberBattleLogArray, forKey: newClan.clanTag + "members")
                    
                    if count == newClan.totalMembers {
                        GlobalVariables.activeClan = loadClan(activeClan: clanTag)
                        completion(didWork)
                    }
                }
            }
        }
    }
}


// First Time adding any clan, has no clans in clansArray & activeClan does not exist
func addNewClan (withLocation clanTag: String, completion: @escaping (String) -> ()) {
    let completionMessage:String = "worked"
    
    // checks if the clan already is added
    if alreadyHaveClan(Tag: clanTag) {
        completion("alreadyHaveClan")
    } else {
        // trys to add the clan
        myAPIWarlogGrab(withLocation: clanTag) { (didWorkAswell: String) in
            
            if didWorkAswell == "wrongTag" {
                completion("wrongTag")
            }
            if didWorkAswell == "serverDown" {
                completion("serverDown")
            }
            if didWorkAswell != "worked"{
                completion("anotherProblem")
            }
            
            // clan grab was successful, add to the myClans array & create a clanTag + "members"
            addToClansArray(clanTag: clanTag)
            
            myAPIClanGrab(withLocation: clanTag) { (didWork: String) in
                
                // after the clan UserDefaults is refreshed
                var newClan = theClan()
                newClan = loadClan(activeClan: clanTag)
                //var newTags = filterMemberList(clan: newClan)
                
                var count = 0
                for member in newClan.playerArray {
                    
                    updateMemberList(withLocation: member) { (newDic: [String:Any]) in
                        count += 1
                        let newMemberBattleLogArray = updateMembersArray(newClan: newClan, newDic: newDic, member: member)
                        // Update the UserDefault
                        UserDefaults.standard.set(newMemberBattleLogArray, forKey: newClan.clanTag + "members")
                        
                        if count == newClan.totalMembers {
                            GlobalVariables.activeClan = loadClan(activeClan: clanTag)
                            completion(completionMessage)
                        }
                    }
                }
            }
        }
    }
}

/*
 UserDefaults.standard.object(forKey: newClan.clanTag + "members") as! [[String:Any]]
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
 // add te new member to the array
 print("---------NEW MEMBER------------")
 let newMemberDic:[String:Any] = ["name": newDic["name"] as! String, "dateDiscovered": newDic["dateDiscovered"] as! Date, "tag": newDic["tag"] as! String, "timeSincePlayed": newDic["timeSincePlayed"] as! Int]
 newMemberBattleLogArray.append(newMemberDic)
 print("added member: ", newMemberDic["name"] as! String)
 }
 */


