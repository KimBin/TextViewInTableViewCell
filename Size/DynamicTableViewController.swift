//
//  DynamicTableViewController.swift
//  Size
//
//  Created by SEN LIU on 15/2/8.
//  Copyright (c) 2015年 SEN LIU. All rights reserved.
//

import UIKit

class DynamicTableViewController: UITableViewController {

    
    var cellText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as TableViewCell
        cell.configureWithText(cellText)
        cell.onTextChange = {
            (text : String) -> Void in
            self.cellText = text
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                tableView.beginUpdates()
                tableView.endUpdates()
            })
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(TableViewCell.cellHeightWithText(self.cellText, tableView: tableView, reuserID: "Cell"))
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as TableViewCell
        cell.textView.becomeFirstResponder()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
