//
//  Representative.swift
//  Representative
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    let name: String
    private let kName = "name"
    
    let party: String
    private let kParty = "party"
    
    let state: String
    private let kState = "state"
    
    let district: String
    private let kDistrict = "district"
    
    let phone: String
    private let kPhone = "phone"
    
    let office: String
    private let kOffice = "office'"
    
    let link: String
    private let kLink = "link"
    
    init(name: String, party: String, state: String, district: String, phone: String, office: String, link: String) {
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
              let party = dictionary[kParty] as? String,
              let state = dictionary[kState] as? String,
              let district = dictionary[kDistrict] as? String,
              let phone = dictionary[kPhone] as? String,
              let office = dictionary[kOffice] as? String,
              let link = dictionary[kLink] as? String
        else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
    
}

