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
    
    func searchRepsByState(){
    
    }
    

    
    
    
}
