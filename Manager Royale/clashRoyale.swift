//
//  clashRoyale.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 1/18/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation


struct playerInfo {
    let name:String
    let trophies:Int
    let playerTag:String
    let clanRank:Int
    let donations:Int
    let donationsReceived:Int
    let role:String
    
    
    // enum for chekcing to see if there is an error
    enum SeriliztionError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        // fetches data from catagorys in the player dictionary, and throws a missing error if they aren't found
        guard let name = json["name"] as? String else {throw SeriliztionError.missing("Summary is missing")}
        guard let trophies = json["trophies"] as? Int else {throw SeriliztionError.missing("Trophies are missing")}
        guard let playerTag = json["tag"] as? String else {throw SeriliztionError.missing("tag is missing")}
        guard let clanRank = json["clanRank"] as? Int else {throw SeriliztionError.missing("clan rank is missing")}
        guard let donations = json["donations"] as? Int else {throw SeriliztionError.missing("donations are missing")}
        guard let donationsReceived = json["donationsReceived"] as? Int else {throw SeriliztionError.missing("donations recieved is missing")}
        guard let role = json["role"] as? String else {throw SeriliztionError.missing("role is missing")}
        
        
        
        // sets the variables of the struct equal to that of the ones from the API
        self.name = name
        self.trophies = trophies
        self.playerTag = playerTag
        self.clanRank = clanRank
        self.donations = donations
        self.donationsReceived = donationsReceived
        self.role = role
    }
    
    // ***** API grab********
    /*
    static func clanGrab (withLocation clanTag:String)
    {
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjljYjhkMjdhLTE2OWQtNDUyOC04ZmMzLTk4MDdkMTJhNGU1MSIsImlhdCI6MTU0Nzg0OTQxNiwic3ViIjoiZGV2ZWxvcGVyLzNmMDgyYmI0LTc4OTAtMjc1Yi1lNTFiLThjODViZGRkMDc5OSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxNzQuMTAwLjgzLjEwIl0sInR5cGUiOiJjbGllbnQifV19.Zfj86o_AG4zYWEAcbz7SsfpmpjZcveORdWMNhEDO-ix23hZSpMvnAbkHE1oS1yopr6-M7juvtF20_ZTCR6k35A",
            "Cache-Control": "no-cache",
            ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.clashroyale.com/v1/clans/%23" + clanTag)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        
            var playerInfoArray:[playerInfo] = []
            if let data = data {  // if the data id found
                do {  // try and serialize the data into a dictionary
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        // save the json to the user prefs
                        UserDefaults.standard.set(json, forKey: clanTag + "clan")
                        UserDefaults.standard.set(clanTag, forKey: "activeClan")
                        // now that I'm saving to the json, I don't really need most of this stuff after these lines of code
                      
                        // if the program has trouble reading in from the API
                        if let reason = json["reason"] as? String{
                            if(reason == "accessDenied"){
                                print("wrong API key")
                            }
                            if(reason == "notFound"){
                                print("The clan tag was wrong")
                                // display message for user
                                // make it return a string that says what the error is
                            }
                        }
                    }
                }catch {  // if it doesn't work, print the error
                    print(error.localizedDescription)
                }
            }
        })
        dataTask.resume()
    }*/
    
}


