//
//  TextView.swift
//  Size
//
//  Created by SEN LIU on 15/2/8.
//  Copyright (c) 2015年 SEN LIU. All rights reserved.
//

import UIKit

class TextView: UITextView {

    var preferredWidth = 10.0;
    override func intrinsicContentSize() -> CGSize {
        let preferredSize = CGSizeMake(CGFloat(preferredWidth), 0.0)
        return sizeThatFits(preferredSize)
    }

}
