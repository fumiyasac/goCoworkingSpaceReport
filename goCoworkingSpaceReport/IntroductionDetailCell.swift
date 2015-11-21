//
//  IntroductionDetailCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/21.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class IntroductionDetailCell: UITableViewCell {

    //詳細情報
    @IBOutlet var detailPlace: UILabel!
    @IBOutlet var detailStasion: UILabel!
    @IBOutlet var detailOpen: UILabel!
    @IBOutlet var detailSeat: UILabel!
    @IBOutlet var detailOwner: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(320)
        )
        
        self.detailPlace.frame = CGRectMake(
            CGFloat(10),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(40)
        )
        
        self.detailStasion.frame = CGRectMake(
            CGFloat(10),
            CGFloat(90),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(40)
        )
        
        self.detailOpen.frame = CGRectMake(
            CGFloat(10),
            CGFloat(150),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(40)
        )
        
        self.detailSeat.frame = CGRectMake(
            CGFloat(10),
            CGFloat(210),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(40)
        )
        
        self.detailOwner.frame = CGRectMake(
            CGFloat(10),
            CGFloat(270),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(40)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
