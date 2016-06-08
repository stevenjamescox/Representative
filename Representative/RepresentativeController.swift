//
//  RepresenativeController.swift
//  Representative
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseUrl = "http://whoismyrepresentative.com/getall_reps_bystate.php?state="
    
    static func searchURLByState(state: String) -> NSURL {
        return NSURL(string: baseUrl + "\(state)&output=json")!
    }
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void ) {
        
        let url = searchURLByState(state)
        
        NetworkController.dataAtURL(url) { (data) in
            
            guard let data = data else { completion(representatives: []);
                return}
            
            NetworkController.jsonFromData(data, completion: { (json) in
                
                
                guard let json = json,
                      let repArray = json["results"] as? [[String: AnyObject]] else {
                    print("couldn't serialize")
                    completion(representatives: []) ; return }
                
                
                let representatives = repArray.flatMap({Representative(dictionary: $0)})
                
                completion(representatives: representatives)
            })
        }
    }
}
