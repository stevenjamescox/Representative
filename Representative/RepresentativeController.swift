//
//  RepresentativeController.swift
//  Representative
//
//  Created by Caleb Hicks on 5/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
        
        let url = searchURLByState(state)
        
        NetworkController.performRequestForURL(url) { (data) in
            
            guard let data = data,
                let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                let representativeDictionaries = json["results"] as? [[String: AnyObject]] else {
                    
                    print("unable to serialize json")
                    completion(representatives: [])
                    return
            }
            
            let representatives = representativeDictionaries.flatMap({Representative(json:$0)})
            
            completion(representatives: representatives)
        }
    }
    
    static let baseURLString = "http://whoismyrepresentative.com"
    
    static func searchURLByState(state: String) -> NSURL {
        return NSURL(string: baseURLString + "/getall_reps_bystate.php?state=\(state)&output=json")!
    }
}

