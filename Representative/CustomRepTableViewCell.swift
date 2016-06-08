//
//  CustomRepTableViewCell.swift
//  Representative
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class CustomRepTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var districtOutlet: UILabel!
    @IBOutlet weak var phoneOutlet: UILabel!
    @IBOutlet weak var officeOutlet: UILabel!
    @IBOutlet weak var linkOutlet: UILabel!
    @IBOutlet weak var stateOutlet: UILabel!
    @IBOutlet weak var partyOutlet: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func loadRepInfo(representative: Representative) {
        
        nameOutlet.text = "Rep. \(representative.name)"
        districtOutlet.text = "District #\(representative.district)"
        phoneOutlet.text = representative.phone
        officeOutlet.text = representative.office
        linkOutlet.text = representative.link
        stateOutlet.text = representative.state
        partyOutlet.text = representative.party
    
    }
}
