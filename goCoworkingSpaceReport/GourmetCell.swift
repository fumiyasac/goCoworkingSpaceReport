//
//  GourmetCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/14.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class GourmetCell: UITableViewCell {

    //表示要素
    @IBOutlet var gourmetTitle: UILabel!
    @IBOutlet var gourmetCategory: UILabel!
    @IBOutlet var gourmetDrink: UILabel!
    @IBOutlet var gourmetLunch: UILabel!
    @IBOutlet var gourmetTel: UILabel!
    @IBOutlet var gourmetAddress: UILabel!
    @IBOutlet var gourmetBudget: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //パーツの配置
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(200)
        )
        
        self.gourmetTitle.frame = CGRectMake(
            CGFloat(10),
            CGFloat(5),
            CGFloat(DeviceSize.screenWidth() - 20),
            CGFloat(20)
        )
        
        self.gourmetCategory.frame = CGRectMake(
            CGFloat(80),
            CGFloat(25),
            CGFloat(DeviceSize.screenWidth() - 90),
            CGFloat(20)
        )
        
        self.gourmetTel.frame = CGRectMake(
            CGFloat(10),
            CGFloat(90),
            CGFloat(DeviceSize.screenWidth() - 20),
            CGFloat(20)
        )
        
        self.gourmetAddress.frame = CGRectMake(
            CGFloat(10),
            CGFloat(110),
            CGFloat(DeviceSize.screenWidth() - 20),
            CGFloat(20)
        )
        
        self.gourmetBudget.frame = CGRectMake(
            CGFloat(0),
            CGFloat(130),
            CGFloat(DeviceSize.screenWidth() - 20),
            CGFloat(60)
        )
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
