//
//  BannerController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class BannerController: UIViewController,UIScrollViewDelegate {
    
    //バナー用スクロールビュー
    @IBOutlet var bannerScrollView: UIScrollView!
    
    //ボタン
    @IBOutlet var bannerButton: UIButton!
    
    //ページ数
    let bannerPageNumber: Int! = 2
    
    //ページカウンター
    var bannerPageCounter: Int! = 0
    
    //タイマー
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //デリゲート
        self.bannerScrollView.delegate = self
        
        //ボタンの設定
        self.bannerButton.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(240),
            CGFloat(60)
        )
        
        //スクロールビューの設定
        self.bannerScrollView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(240),
            CGFloat(60)
        )
        
        self.bannerScrollView.contentSize = CGSizeMake(
            CGFloat(240 * (self.bannerPageNumber + 1)),
            CGFloat(60)
        )
        
        self.bannerScrollView.pagingEnabled = false
        self.bannerScrollView.scrollEnabled = false
        self.bannerScrollView.directionalLockEnabled = true
        self.bannerScrollView.showsHorizontalScrollIndicator = false
        self.bannerScrollView.showsVerticalScrollIndicator = true
        self.bannerScrollView.bounces = true
        self.bannerScrollView.scrollsToTop = false
        
        //UIImageViewを作成してScrollViewへ追加
        for i in 0...bannerPageNumber {
           
            let bannerImageView: UIImageView! = UIImageView()
            bannerImageView.frame = CGRectMake(
                CGFloat(240*i),
                CGFloat(0),
                CGFloat(240),
                CGFloat(60)
            )
            
            switch (i) {
                case 0:
                    bannerImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test1.rawValue)
                    break
                case 1:
                    bannerImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test2.rawValue)
                    break
                case 2:
                    bannerImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test3.rawValue)
                    break
                default:
                    bannerImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test0.rawValue)
                    break
            }
            self.bannerScrollView.addSubview(bannerImageView)
        }
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(6.0, target: self, selector: Selector("scrollViewAnimation"), userInfo: nil, repeats: true)
    }
    
    //スクロールを検知した際に行われる処理
    func scrollViewAnimation() {
        
        self.bannerPageCounter = (self.bannerPageCounter + 1) % (self.bannerPageNumber + 1)
        
        //アニメーションをする
        UIView.animateWithDuration(0.6, delay: 0, options: [], animations: { () -> Void in
            self.bannerScrollView.contentOffset.x = CGFloat(240 * self.bannerPageCounter)
            }, completion: { (finished: Bool) -> Void in
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bannerButtonAction(sender: UIButton) {
        print("Banner Number:\(self.bannerPageCounter) tapped!")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
