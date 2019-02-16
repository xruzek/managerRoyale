//
//  Weather.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 1/17/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//
// **** This was the example I follwed to help me learn APIs
import Foundation

struct Weather {
    let summary:String
    let icon:String
    let temperature:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("Summary is missing")}
        
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("icon is missing")}

        guard let temperature = json["temperatureMax"] as? Double else {throw SerializationError.missing("temperature is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
        
    }
    
    static let basePath = "https://api.darksky.net/forecast/73096f69b558dc83a865c5f9d956f26e/"
    
    
    static func forecast (withLocation location:String, completion: @escaping ([Weather]) -> ())
    {
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forcastArray:[Weather] = []
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    {
                        if let dailyForcasts = json["daily"] as? [String:Any]{
                            if let dailyData = dailyForcasts["data"] as? [[String:Any]]{
                                for dataPoint in dailyData {
                                    if let weatherObject = try? Weather(json: dataPoint){
                                        forcastArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                completion(forcastArray)
            }
        }
        task.resume()
    }
    
}
