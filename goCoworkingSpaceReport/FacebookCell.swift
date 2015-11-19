//
//  FacebookCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class FacebookCell: UITableViewCell {

    //Facebookのタイムラインを表示
    @IBOutlet var fbImage: UIImageView!
    @IBOutlet var fbTitle: UILabel!
    @IBOutlet var fbDetail: UILabel!
    @IBOutlet var fbDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.fbImage.frame = CGRectMake(
            CGFloat(10),
            CGFloat(10),
            CGFloat(80),
            CGFloat(80)
        )
        
        self.fbTitle.frame = CGRectMake(
            CGFloat(100),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(20)
        )
        
        self.fbDetail.frame = CGRectMake(
            CGFloat(100),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(40)
        )
        
        self.fbDate.frame = CGRectMake(
            CGFloat(100),
            CGFloat(72),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(16)
        )
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
