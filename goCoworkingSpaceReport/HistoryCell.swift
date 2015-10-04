//
//  HistoryCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    //写真
    @IBOutlet var spaceImageSmall: UIImageView!
    
    //日付・タイトル
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var spaceTitleLabel: UILabel!
    
    //開くラベル
    @IBOutlet var openLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.spaceImageSmall.frame = CGRectMake(
            CGFloat(10),
            CGFloat(10),
            CGFloat(40),
            CGFloat(40)
        )
        
        self.dateLabel.frame = CGRectMake(
            CGFloat(60),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth()-70),
            CGFloat(20)
        )
        
        self.spaceTitleLabel.frame = CGRectMake(
            CGFloat(60),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()-70),
            CGFloat(20)
        )
        
        self.openLabel.frame = CGRectMake(
            CGFloat(DeviceSize.screenWidth()-60),
            CGFloat(50),
            CGFloat(50),
            CGFloat(20)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
