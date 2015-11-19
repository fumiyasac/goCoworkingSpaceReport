//
//  IntroductionImageCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class IntroductionImageCell: UITableViewCell {

    //写真
    @IBOutlet var introductionImage: UIImageView!
    
    //場所名
    @IBOutlet var introductionTitle: UILabel!
    
    //最寄駅
    @IBOutlet var introductionStation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(180)
        )
        
        self.introductionImage.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(180)
        )
        
        self.introductionTitle.frame = CGRectMake(
            CGFloat(5),
            CGFloat(140),
            CGFloat(DeviceSize.screenWidth()-10),
            CGFloat(20)
        )
        
        self.introductionStation.frame = CGRectMake(
            CGFloat(5),
            CGFloat(160),
            CGFloat(DeviceSize.screenWidth()-10),
            CGFloat(20)
        )
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
