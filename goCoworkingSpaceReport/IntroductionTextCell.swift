//
//  IntroductionTextCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class IntroductionTextCell: UITableViewCell {

    //サマリー文章
    @IBOutlet var introductionTextSummary: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(120)
        )
        
        self.introductionTextSummary.frame = CGRectMake(
            CGFloat(5),
            CGFloat(5),
            CGFloat(DeviceSize.screenWidth()-10),
            CGFloat(110)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
