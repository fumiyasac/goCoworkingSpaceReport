//
//  DetailButtonCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class DetailButtonCell: UITableViewCell {

    //ボタン背景
    @IBOutlet var viewBackground: UIView!
    
    //ボタン画像
    @IBOutlet var viewThumbImage: UIImageView!
    
    //ボタンタイトル
    @IBOutlet var detailButtonTitle: UILabel!
    
    //ボタン注意書き
    @IBOutlet var detailButtonRemark: UILabel!
    
    //ボタンテキスト
    @IBOutlet var detailButtonText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(100)
        )

        self.viewThumbImage.frame = CGRectMake(
            CGFloat(5),
            CGFloat(5),
            CGFloat(90),
            CGFloat(90)
        )
        
        self.detailButtonTitle.frame = CGRectMake(
            CGFloat(100),
            CGFloat(5),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(20)
        )
        
        self.detailButtonRemark.frame = CGRectMake(
            CGFloat(100),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()-120),
            CGFloat(20)
        )
        
        self.detailButtonText.frame = CGRectMake(
            CGFloat(95),
            CGFloat(50),
            CGFloat(DeviceSize.screenWidth()-110),
            CGFloat(40)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
