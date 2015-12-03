//
//  PortfolioCollectionViewCell.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/01.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class PortfolioCollectionViewCell: UICollectionViewCell {

    @IBOutlet var backShadowView: UIView!
    @IBOutlet var favoriteIcon: UILabel!
    @IBOutlet var portfolioImage: UIImageView!
    @IBOutlet var descText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()*2/3),
            CGFloat(160)
        )
        
        self.backShadowView.frame = CGRectMake(
            CGFloat(3),
            CGFloat(3),
            CGFloat((DeviceSize.screenWidth()*2/3)-6),
            CGFloat(152)
        )
        
        self.favoriteIcon.frame = CGRectMake(
            CGFloat(6),
            CGFloat(6),
            CGFloat(70),
            CGFloat(20)
        )
        
        self.portfolioImage.frame = CGRectMake(
            CGFloat(3),
            CGFloat(3),
            CGFloat((DeviceSize.screenWidth()*2/3)-6),
            CGFloat(152)
        )
        
        self.descText.frame = CGRectMake(
            CGFloat(3),
            CGFloat(109),
            CGFloat((DeviceSize.screenWidth()*2/3)-6),
            CGFloat(46)
        )
        
        //背景に影をつける
        self.backShadowView.layer.masksToBounds = false;
        self.backShadowView.layer.cornerRadius = 0;
        self.backShadowView.layer.shadowOffset = CGSizeMake(0, 0);
        self.backShadowView.layer.shadowRadius = 1;
        self.backShadowView.layer.shadowOpacity = 0.2;
        
    }

}
