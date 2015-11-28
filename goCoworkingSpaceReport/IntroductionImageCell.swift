//
//  IntroductionImageCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class IntroductionImageCell: UITableViewCell {

    //ラベル
    @IBOutlet var introductionHead: UILabel!
    
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

        self.introductionHead.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(30)
        )
        
        self.introductionImage.frame = CGRectMake(
            CGFloat(0),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(200)
        )
        
        self.introductionTitle.frame = CGRectMake(
            CGFloat(5),
            CGFloat(190),
            CGFloat(DeviceSize.screenWidth()-10),
            CGFloat(20)
        )
        
        self.introductionStation.frame = CGRectMake(
            CGFloat(5),
            CGFloat(210),
            CGFloat(DeviceSize.screenWidth()-10),
            CGFloat(20)
        )
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
