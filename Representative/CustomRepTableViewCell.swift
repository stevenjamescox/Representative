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
        // Initialization code
    }

    @IBOutlet weak var nameOutlet: UIView!
    @IBOutlet weak var districtOutlet: UIView!
    @IBOutlet weak var phoneOutlet: UIView!
    @IBOutlet weak var officeOutlet: UIView!
    @IBOutlet weak var linkOutlet: UIView!
    @IBOutlet weak var stateOutlet: UIView!
    @IBOutlet weak var partyOutlet: UIView!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
