//
//  LocationCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2016/01/24.
//  Copyright © 2016年 just1factory. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet var locaShopName: UILabel!
    @IBOutlet var locaImageView: UIImageView!
    @IBOutlet var locaShopGenre: UILabel!
    @IBOutlet var locaShopAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DeviceSize.screenHeight())
        )
        
        self.locaShopName.frame = CGRectMake(
            CGFloat(15),
            CGFloat(10),
            CGFloat(DeviceSize.screenWidth() - 30),
            CGFloat(20)
        )
        
        self.locaShopGenre.frame = CGRectMake(
            CGFloat(75),
            CGFloat(35),
            CGFloat(DeviceSize.screenWidth() - 90),
            CGFloat(20)
        )
        
        self.locaShopAddress.frame = CGRectMake(
            CGFloat(75),
            CGFloat(60),
            CGFloat(DeviceSize.screenWidth() - 90),
            CGFloat(20)
        )
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
