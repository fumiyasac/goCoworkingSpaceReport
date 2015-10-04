//
//  NowHereCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class NowHereCell: UITableViewCell {

    //画像：画像
    @IBOutlet var spaceImageMedium: UIImageView!
    
    //ステータスラベル
    @IBOutlet var statusLabel: UILabel!
    
    //場所名
    @IBOutlet var spaceTitle: UILabel!
    
    //人画像
    @IBOutlet var profileImageSmall: UIImageView!
    
    //ユーザー名
    @IBOutlet var usernameLabel: UILabel!
    
    //Check
    @IBOutlet var checkText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.statusLabel.frame = CGRectMake(
            CGFloat(80),
            CGFloat(10),
            CGFloat(100),
            CGFloat(20)
        )
        
        self.spaceTitle.frame = CGRectMake(
            CGFloat(80),
            CGFloat(40),
            CGFloat(DeviceSize.screenWidth()-90),
            CGFloat(20)
        )
        
        self.usernameLabel.frame = CGRectMake(
            CGFloat(60),
            CGFloat(90),
            CGFloat(DeviceSize.screenWidth()-70),
            CGFloat(20)
        )
        
        self.checkText.frame = CGRectMake(
            CGFloat(60),
            CGFloat(110),
            CGFloat(DeviceSize.screenWidth()-70),
            CGFloat(20)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
