//
//  NetworkController.swift
//  Representative
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {

    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
    guard let url = NSURL(string: url) else { completion(data: nil); return }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            
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
    
    
    
    
    
    
    
}
