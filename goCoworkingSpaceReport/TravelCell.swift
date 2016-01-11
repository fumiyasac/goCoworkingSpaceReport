//
//  TravelCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2016/01/11.
//  Copyright © 2016年 just1factory. All rights reserved.
//

import UIKit

class TravelCell: UITableViewCell {

    @IBOutlet var hotelName: UILabel!
    @IBOutlet var hotelMinCharge: UILabel!
    @IBOutlet var hotelReviewCount: UILabel!
    @IBOutlet var hotelReviewAverage: UILabel!
    @IBOutlet var hotelSpecialText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DeviceSize.screenHeight())
        )
        
        self.hotelName.frame = CGRectMake(
            CGFloat(95),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth() - 115),
            CGFloat(20)
        )
        
        self.hotelSpecialText.frame = CGRectMake(
            CGFloat(10),
            CGFloat(120),
            CGFloat(DeviceSize.screenWidth() - 10),
            CGFloat(20)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
