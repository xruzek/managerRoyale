//
//  clashRoyaleWarlog.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 1/22/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation

struct playerWarlog {
    let name:String
    let playerTag:String
    let cardsEarned:Int
    let warDaysPlayed:Int
    let warDaysWon:Int
    let collectionBattlesPlayed:Int
    
    // enum for chekcing to see if there is an error
    enum SeriliztionError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        // fetches data from catagorys in the player dictionary, and throws a missing error if they aren't found
        guard let playerTag = json["tag"] as? String else {throw SeriliztionError.missing("tag is missing")}
        guard let cardsEarned = json["cardsEarned"] as? Int else {throw SeriliztionError.missing("cards earned is missing")}
        guard let warDaysPlayed = json["battlesPlayed"] as? Int else {throw SeriliztionError.missing("war days played are missing")}
        guard let warDaysWon = json["wins"] as? Int else {throw SeriliztionError.missing("war day wins is missing")}
        guard let collectionBattlesPlayed = json["collectionDayBattlesPlayed"] as? Int else {throw SeriliztionError.missing("collection battles are missing")}
        guard let name = json["name"] as? String else {throw SeriliztionError.missing("name is missing")}
        
        
        
        // sets the variables of the struct equal to that of the ones from the API
        self.cardsEarned = cardsEarned
        self.warDaysPlayed = warDaysPlayed
        self.warDaysWon = warDaysWon
        self.collectionBattlesPlayed = collectionBattlesPlayed
        self.playerTag = playerTag
        self.name = name
        
    }
    
    /*
        static func warlogGrab (withLocation clanTag:String)
        {
            let headers = [
                "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjljYjhkMjdhLTE2OWQtNDUyOC04ZmMzLTk4MDdkMTJhNGU1MSIsImlhdCI6MTU0Nzg0OTQxNiwic3ViIjoiZGV2ZWxvcGVyLzNmMDgyYmI0LTc4OTAtMjc1Yi1lNTFiLThjODViZGRkMDc5OSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxNzQuMTAwLjgzLjEwIl0sInR5cGUiOiJjbGllbnQifV19.Zfj86o_AG4zYWEAcbz7SsfpmpjZcveORdWMNhEDO-ix23hZSpMvnAbkHE1oS1yopr6-M7juvtF20_ZTCR6k35A",
                "Cache-Control": "no-cache",
                ]
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://api.clashroyale.com/v1/clans/%23" + clanTag + "/warlog")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let data = data {  // if the data id found
                do {  // try and serialize the data into a dictionary
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        //print(json)
                        UserDefaults.standard.set(json, forKey: clanTag + "warlog")
                    }
                }catch {  // if it doesn't work, print the error
                    print(error.localizedDescription)
                }
            }
        })
        dataTask.resume()
    }*/
        
}
    

