//
//  TableViewCell.swift
//  Size
//
//  Created by SEN LIU on 15/2/8.
//  Copyright (c) 2015年 SEN LIU. All rights reserved.
//

import UIKit

private var sizingCell : TableViewCell?

class TableViewCell: UITableViewCell, UITextViewDelegate {

     var onTextChange : ((String) -> Void)?
    
    @IBOutlet weak var textView: TextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.userInteractionEnabled = false
        textView.delegate = self
        //self.contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWithText(text : String) -> Void {
        textView.text = text
    }
    
    class func cellHeightWithText(text : String, tableView: UITableView, reuserID: String) -> Double {

        if (sizingCell == nil) {
            sizingCell = tableView.dequeueReusableCellWithIdentifier(reuserID) as? TableViewCell
            sizingCell?.textView.scrollEnabled = false
        }
        sizingCell?.configureWithText(text)
        sizingCell?.setNeedsLayout()
        sizingCell?.layoutIfNeeded()
        sizingCell?.textView.preferredWidth = Double(sizingCell!.textView.bounds.size.width)
      
         let size = sizingCell?.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        print("TextViewSize:\(sizingCell?.textView.intrinsicContentSize())\n")
        print("cellSize:\(size)\n\n")
       
        return Double(size!.height)
        

    }
    
    func textViewDidChange(textView: UITextView) {
        onTextChange?(textView.text)

    }
    
    
}
