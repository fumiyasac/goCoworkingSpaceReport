//
//  HistoryTappedCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class HistoryTappedCell: UITableViewCell {

    //写真
    @IBOutlet var spaceImageSmall: UIImageView!
    
    //日付・タイトル
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var spaceTitleLabel: UILabel!
    
    //Check-In・Check-Out
    @IBOutlet var checkInTitle: UILabel!
    @IBOutlet var checkOutTitle: UILabel!
    
    @IBOutlet var checkInLabel: UILabel!
    @IBOutlet var checkOutLabel: UILabel!
    
    //メモ
    @IBOutlet var textMemo: UITextView!
    
    //ボタン表記
    @IBOutlet var closeLabel: UILabel!
    
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

        self.checkInTitle.frame = CGRectMake(
            CGFloat(10),
            CGFloat(85),
            CGFloat(DeviceSize.screenWidth()/2-20),
            CGFloat(20)
        )
        
        self.checkOutTitle.frame = CGRectMake(
            CGFloat(DeviceSize.screenWidth()/2+10),
            CGFloat(85),
            CGFloat(DeviceSize.screenWidth()/2-20),
            CGFloat(20)
        )
        
        self.checkInLabel.frame = CGRectMake(
            CGFloat(10),
            CGFloat(105),
            CGFloat(DeviceSize.screenWidth()/2-20),
            CGFloat(20)
        )
        
        self.checkOutLabel.frame = CGRectMake(
            CGFloat(DeviceSize.screenWidth()/2+10),
            CGFloat(105),
            CGFloat(DeviceSize.screenWidth()/2-20),
            CGFloat(20)
        )
        
        self.textMemo.frame = CGRectMake(
            CGFloat(5),
            CGFloat(150),
            CGFloat(DeviceSize.screenWidth()-10),
            CGFloat(85)
        )
        
        self.closeLabel.frame = CGRectMake(
            CGFloat(DeviceSize.screenWidth()-60),
            CGFloat(250),
            CGFloat(50),
            CGFloat(20)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
