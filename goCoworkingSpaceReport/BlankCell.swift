//
//  BlankCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/14.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class BlankCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //※ダミーのセルなので大きさの再設定のみ
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(0)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
