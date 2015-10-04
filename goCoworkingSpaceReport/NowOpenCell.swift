//
//  NowOpenCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class NowOpenCell: UITableViewCell {

    //タイトル
    @IBOutlet var spaceTitleBold: UILabel!
    
    //画像
    @IBOutlet var spaceImageMedium: UIImageView!
    
    //場所・時間
    @IBOutlet var spacePlace: UILabel!
    @IBOutlet var spaceTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.spaceTitleBold.frame = CGRectMake(
            CGFloat(10),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth()-20),
            CGFloat(20)
        )
        
        self.spacePlace.frame = CGRectMake(
            CGFloat(120),
            CGFloat(65),
            CGFloat(DeviceSize.screenWidth()-130),
            CGFloat(20)
        )
        
        self.spaceTime.frame = CGRectMake(
            CGFloat(120),
            CGFloat(120),
            CGFloat(DeviceSize.screenWidth()-130),
            CGFloat(20)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
