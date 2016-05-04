//
//  NetworkController.swift
//  Post
//
//  Created by Caleb Hicks on 5/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func performRequestForURL(url: NSURL, completion:(data: NSData?) -> Void) {
        
        let request = NSMutableURLRequest(URL: url)

        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            
            completion(data: data)
        }
        
        dataTask.resume()
    }
    
}