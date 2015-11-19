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
    @IBOutlet var dateEvent: UILabel!
    @IBOutlet var imageEvent: UIImageView!
    @IBOutlet var titleEvent: UILabel!
    @IBOutlet var detailEvent: UILabel!
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
        
        self.dateEvent.frame = CGRectMake(
            CGFloat(5),
            CGFloat(5),
            CGFloat(35),
            CGFloat(35)
        )
        self.dateEvent.layer.cornerRadius = CGFloat(17.5)
        
        self.imageEvent.frame = CGRectMake(
            CGFloat(10),
            CGFloat(10),
            CGFloat(80),
            CGFloat(80)
        )

        self.titleEvent.frame = CGRectMake(
            CGFloat(100),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(20)
        )
        
        self.detailEvent.frame = CGRectMake(
            CGFloat(100),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(40)
        )
        
        self.siteEvent.frame = CGRectMake(
            CGFloat(100),
            CGFloat(72),
            CGFloat(100),
            CGFloat(16)
        )
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
