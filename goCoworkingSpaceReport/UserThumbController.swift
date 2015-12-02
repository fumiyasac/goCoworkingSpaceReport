//
//  UserThumbController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/08.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class UserThumbController: UIViewController,UIScrollViewDelegate,UIGestureRecognizerDelegate {

    //みんなのPhoto表示用のUIScrollView
    @IBOutlet var userPhotoScrollView: UIScrollView!
    
    //みんなのPhoto用のラベル
    @IBOutlet var userPhotoLabel: UILabel!
    
    let pageNumber: Int! = 2
    let pagePicsCount: Int! = 7
    
    override func viewWillAppear(animated: Bool) {
         self.userPhotoScrollView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(30),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DetailTableDefinition.EveryoneGalleryHeaderOnly.sectionHeaderHeight()-50)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート
        self.userPhotoScrollView.delegate = self
        
        //スクロールビューの設定
        self.userPhotoScrollView.contentSize = CGSizeMake(
            CGFloat(DeviceSize.screenWidth() * self.pageNumber),
            CGFloat(DetailTableDefinition.EveryoneGalleryHeaderOnly.sectionHeaderHeight()-50)
        )
        
        self.userPhotoScrollView.pagingEnabled = false
        self.userPhotoScrollView.scrollEnabled = true
        self.userPhotoScrollView.directionalLockEnabled = false
        self.userPhotoScrollView.showsHorizontalScrollIndicator = true
        self.userPhotoScrollView.showsVerticalScrollIndicator = false
        self.userPhotoScrollView.bounces = false
        self.userPhotoScrollView.scrollsToTop = false
        
        //UIImageViewを作成してScrollViewへ追加
        for i in 0...pagePicsCount {
            
            let userView: UIView! = UIView()
            userView.frame = CGRectMake(
                CGFloat(DeviceSize.screenWidth()/4*i),
                CGFloat(0),
                CGFloat(DeviceSize.screenWidth()/4),
                CGFloat(DetailTableDefinition.EveryoneGalleryHeaderOnly.sectionHeaderHeight()-50)
            )
            self.userPhotoScrollView.addSubview(userView)
            
            //TapGestureを付与する
            let myLongPressGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "imageTapGesture:")
            myLongPressGesture.delegate = self;
            
            let userImageView: UIImageView! = UIImageView()
            userView.addSubview(userImageView)
            
            let userImageLabelTitle: UILabel! = UILabel()
            userView.addSubview(userImageLabelTitle)

            let userImageLabelDate: UILabel! = UILabel()
            userView.addSubview(userImageLabelDate)
            
            userImageView.frame = CGRectMake(
                ceil(CGFloat((DeviceSize.screenWidth()/4)/2 - 35)),
                CGFloat(18),
                CGFloat(70),
                CGFloat(70)
            )
            userImageView.layer.cornerRadius = CGFloat(35)
            userImageView.addGestureRecognizer(myLongPressGesture)
            userImageView.tag = i
            
            userImageLabelTitle.font = UIFont.boldSystemFontOfSize(10.0)
            userImageLabelTitle.textColor = ColorDefinition.colorWithHexString(ColorStatus.Gray.rawValue)
            userImageLabelTitle.textAlignment = NSTextAlignment.Center
            userImageLabelTitle.text = "test"
            userImageLabelTitle.frame = CGRectMake(
                CGFloat(5),
                CGFloat(100),
                ceil(CGFloat(DeviceSize.screenWidth()/4-10)),
                CGFloat(20)
            )
            
            userImageLabelDate.font = UIFont.boldSystemFontOfSize(10.0)
            userImageLabelDate.textColor = ColorDefinition.colorWithHexString(ColorStatus.Gray.rawValue)
            userImageLabelDate.textAlignment = NSTextAlignment.Center
            userImageLabelDate.text = "2015.11.21"
            userImageLabelDate.frame = CGRectMake(
                CGFloat(5),
                CGFloat(120),
                ceil(CGFloat(Int(DeviceSize.screenWidth()/4-10))),
                CGFloat(20)
            )
            
            if(i % 2 == 0){
                userImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test1.rawValue)
            }else{
                userImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test2.rawValue)
            }
            
            //TapGestureができるようにする
            userView.multipleTouchEnabled = true
            userImageView.userInteractionEnabled = true
        }
        
    }
    
    //中の画像がタップされたら親のViewControllerのメソッドを呼び出す
    func imageTapGesture(sender: UITapGestureRecognizer) {
        let tappedIndex: Int! = sender.view?.tag
        
        print("----- Tapped. -----")
        print(tappedIndex)
    }
    
    //投稿画面へのボタンアクション
    @IBAction func postPhotoAction(sender: UIButton) {
        
        print("----- postPhotoAction -----")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
