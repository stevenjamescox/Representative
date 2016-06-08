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
    
        let url = String(searchURLByState(state))
        
            NetworkController.dataAtURL(url) { (data) in
            
            // Step 3 = i have my data, hopefully it's not nil, let's check, complete with [] if not
                guard let data = data else { completion(representatives: []); return}
            
            // Step 4 = I have my data, convert to json by passing it through jsonFromData func in NetworkController
                
                    NetworkController.jsonFromData(data, completion: { (json) in
                
            // Step 5 = Make sure that the json variable passed back in the completion actually has something in it
            // Step 6 = we go to the specific key in the json we want to read from (in our case it's the "cards" key to go get Array of dictionaries of type [String: AnyObject])
                
                guard let json = json, repArray = json["result"] as? [[String: AnyObject]] else { completion(representatives: []) ; return }
            // Step 7 = create new instances of our model objects from the array of data (usually a dictionary by flatMapping that array. (in our case we're creating new cards by calling the failable initializer in Card model which wants us to pass in a dictionary. we can do that because our cardArray is an array of dictionaries)
                
                let representatives = repArray.flatMap({Representative(dictionary: $0)})
            // Step 8 = complete with the array of cards we just created
                completion(representatives: representatives)
            })
        }
    }
}
