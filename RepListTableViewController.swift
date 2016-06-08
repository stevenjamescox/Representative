//
//  RepListTableViewController.swift
//  Representative
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class RepListTableViewController: UITableViewController {

    var state: String?
    var representatives: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath) as? CustomRepTableViewCell ?? CustomRepTableViewCell()

        let representative = representatives[indexPath.row]
        
        cell.loadRepInfo(representative)

        return cell
    }

}
