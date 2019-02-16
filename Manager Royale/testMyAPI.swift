//
//  testMyAPI.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 2/11/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation


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
    //request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let data = data {  // if the data id found
            do {  // try and serialize the data into a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let clanName:String = json["name"] as? String{
                        
                        // Read Current clan User Default, save that to past UserDefaul, then whatever you read in the to new one.
                        if var clansArray = UserDefaults.standard.array(forKey: "myClans") as? [[String: Any]] {
                            clansArray.append(["name": clanName, "tag": clanTag])
                            UserDefaults.standard.set(clansArray, forKey: "myClans")
                        }else {
                            var newArray: [[String: Any]] = []
                            newArray.append(["name": clanName, "tag": clanTag])
                            UserDefaults.standard.set(newArray, forKey: "myClans")
                        }
                        UserDefaults.standard.set(json, forKey: clanTag + "myClan")
                        UserDefaults.standard.set(clanTag, forKey: "activeClan")
                    }
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
                
                    UserDefaults.standard.set(json, forKey: clanTag + "myWarlog")
                    
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

