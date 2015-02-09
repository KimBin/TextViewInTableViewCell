//
//  TableViewController.swift
//  Size
//
//  Created by SEN LIU on 15/2/8.
//  Copyright (c) 2015年 SEN LIU. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITextViewDelegate {

    var firstTimeViewDidAppear = true
    @IBOutlet weak var textView: TextView!
    @IBOutlet weak var textViewCell: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func viewDidAppear(animated: Bool) {
        firstTimeViewDidAppear = false
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.0, animations: { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()

        });
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        textView.preferredWidth = Double(textView.frame.size.width)
        let size = textViewCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return size.height + 1
    }
    
    func textViewDidChange(textView: UITextView) {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        })
    }
    
    
}
