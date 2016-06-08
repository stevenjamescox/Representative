//
//  NetworkController.swift
//  Representative
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {

    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
   // guard let url = NSURL(string: url) else { completion(data: nil); return }
        
        let request = NSMutableURLRequest(URL: url)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            
            if let error = error {
            print(error.localizedDescription)
            completion(data: nil)
                return
            }
            
            if let data = data {
            print("data retrieved")
            completion(data: data)
                return
            }
        }
        task.resume()
    }
    
    static func jsonFromData(data:NSData, completion: (json: [String: AnyObject]?) -> Void){
        let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
        completion(json: json)
    }
}
