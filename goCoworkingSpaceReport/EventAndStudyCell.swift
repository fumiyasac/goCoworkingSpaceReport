//
//  EventAndStudyCell.swift
//  goCoworkingSpaceReportRelatedController
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

import QuartzCore

class EventAndStudyCell: UITableViewCell {
    
    //Element
    @IBOutlet var scheduleEvent: UILabel!
    @IBOutlet var dateEvent: UILabel!
    @IBOutlet var titleEvent: UILabel!
    @IBOutlet var siteEvent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(100)
        )

        self.scheduleEvent.frame = CGRectMake(
            CGFloat(10),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth() - 20),
            CGFloat(20)
        )
        
        self.siteEvent.frame = CGRectMake(
            CGFloat(10),
            CGFloat(35),
            CGFloat(100),
            CGFloat(20)
        )
        self.siteEvent.layer.cornerRadius = CGFloat(8.0)
        
        self.dateEvent.frame = CGRectMake(
            CGFloat(120),
            CGFloat(35),
            CGFloat(170),
            CGFloat(20)
        )
        
        self.titleEvent.frame = CGRectMake(
            CGFloat(10),
            CGFloat(58),
            CGFloat(DeviceSize.screenWidth() - 45),
            CGFloat(40)
        )
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
