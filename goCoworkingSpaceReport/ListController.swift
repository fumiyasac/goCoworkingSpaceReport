//
//  ListController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/25.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

class ListController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {

    //ラベルボタン
    @IBOutlet var backButtonLabel: UILabel!
    @IBOutlet var nowOpenButton: UIButton!
    @IBOutlet var nowHereButton: UIButton!
    @IBOutlet var visitHistoryButton: UIButton!
    
    //プロフィール表示用コンテナ
    @IBOutlet var profileContainer: UIView!
    
    //コンテンツ表示用コンテナ
    @IBOutlet var nowOpenContainer: UIView!
    @IBOutlet var nowHereContainer: UIView!
    @IBOutlet var visitHistoryContainer: UIView!
    
    //コンテナ内包用スクロールビュー
    @IBOutlet var innerContainerScrollView: UIScrollView!
    
    //現在ページ表示位置用のメンバ変数
    var currentDisplayViewNumber: Int!

    var wholeScrollWidth: CGFloat!
    var wholeScrollHeight: CGFloat!
    
    var inactiveValue: CGFloat! = 0.5
    var activeValue: CGFloat!   = 1.0
    
    var downHeight: Int! = 93
    
    //現在の表示コンテナ状態を判定する
    var currentStatus: ListStatus!
    
    //現在の開閉状態を判定する
    var windowStatus: AnotherWindow!
    
    //ナビゲーションのアイテム
    var backButton: UIBarButtonItem!
    var profileButton: UIBarButtonItem!
    
    //コンテナの最大数
    let maxContainer: Int! = 3
    
    override func viewWillAppear(animated: Bool) {
        
        //現在起動中のデバイスを取得（スクリーンの幅・高さ）
        let screenWidth: Int!  = DeviceSize.screenWidth()
        let screenHeight: Int! = DeviceSize.screenHeight()
        
        let deviceContainerWidth: CGFloat!  = CGFloat(screenWidth)
        let deviceContainerHeight: CGFloat! = CGFloat(screenHeight - self.downHeight)
        
        //スクロールビューのサイズ再設定
        self.innerContainerScrollView.frame = CGRectMake(
            CGFloat(0.0),
            CGFloat(self.downHeight),
            deviceContainerWidth,
            deviceContainerHeight
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NavigationControllerのデリゲート
        self.navigationController?.delegate = self
        
        //ナビゲーション関連設定
        self.navigationController?.navigationBar.barTintColor = ColorDefinition.colorWithHexString(ColorStatus.Yellow.rawValue)
        self.navigationController?.navigationBar.tintColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
        
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 15)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        
        //Buttonを設置
        self.backButton = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "onClickBackButton:")
        self.profileButton = UIBarButtonItem(title: "Profile", style: .Plain, target: self, action: "onClickProfileButton:")

        self.navigationItem.title = TitleText.Top.rawValue
        self.navigationItem.leftBarButtonItem  = self.backButton
        self.navigationItem.rightBarButtonItem = self.profileButton
        
        //スクロールビュー関連設定
        self.innerContainerScrollView.delegate = self
        
        //スクロールビューの設定
        wholeScrollWidth  = CGFloat(Int(self.view.frame.size.width) * maxContainer)
        wholeScrollHeight = CGFloat(Int(self.view.frame.size.height) - self.downHeight)
        
        self.innerContainerScrollView.contentSize = CGSizeMake(
            CGFloat(wholeScrollWidth),
            CGFloat(wholeScrollHeight)
        )
        
        //現在位置の初期設定
        self.currentStatus = ListStatus.NowOpened
        self.changeStatusWhenScroll(ListStatus.NowOpened.toListControlNumber())
        
        //UIScrollViewの細かい設定
        self.initWithScrollViewSetting()
        
        //コンテナの配置
        for i in 0...maxContainer{
            
            let scrollViewInnerWidth :Int = Int(self.view.frame.size.width) * i
            
            //Containerの配置をする
            if (i == ListStatus.NowOpened.toListControlNumber()) {
                
                self.nowOpenContainer.frame = CGRectMake(
                    CGFloat(scrollViewInnerWidth),
                    CGFloat(0.0),
                    CGFloat(wholeScrollWidth),
                    CGFloat(wholeScrollHeight)
                )
                self.innerContainerScrollView.addSubview(self.nowOpenContainer)
                
            } else if (i == ListStatus.AlreadyGone.toListControlNumber()) {

                self.visitHistoryContainer.frame = CGRectMake(
                    CGFloat(scrollViewInnerWidth),
                    CGFloat(0.0),
                    CGFloat(wholeScrollWidth),
                    CGFloat(wholeScrollHeight)
                )
                self.innerContainerScrollView.addSubview(self.visitHistoryContainer)
                
            } else if (i == ListStatus.StayingHere.toListControlNumber()) {
                
                self.nowHereContainer.frame = CGRectMake(
                    CGFloat(scrollViewInnerWidth),
                    CGFloat(0.0),
                    CGFloat(wholeScrollWidth),
                    CGFloat(wholeScrollHeight)
                )
                self.innerContainerScrollView.addSubview(self.nowHereContainer)
                
            }
            
        }

    }
    
    func onClickBackButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func onClickProfileButton(sender: UIBarButtonItem) {
        print("It will be Slide Contents to right and show & edit profile page.")
    }
    
    @IBAction func displayNowOpen(sender: UIButton) {
        
        self.changeStatusWhenScroll(ListStatus.NowOpened.toListControlNumber())
        self.changeContainerOffsetWhenButtonPush(ListStatus.NowOpened.toListControlNumber())
    }
    
    @IBAction func displayVisitHistory(sender: UIButton) {
        
        self.changeStatusWhenScroll(ListStatus.AlreadyGone.toListControlNumber())
        self.changeContainerOffsetWhenButtonPush(ListStatus.AlreadyGone.toListControlNumber())
    }
    
    @IBAction func displayNowHere(sender: UIButton) {
        
        self.changeStatusWhenScroll(ListStatus.StayingHere.toListControlNumber())
        self.changeContainerOffsetWhenButtonPush(ListStatus.StayingHere.toListControlNumber())
    }
    
    //UIScrollViewの設定
    func initWithScrollViewSetting() {
        
        //オプションの設定（今回は横にスクロール）
        self.innerContainerScrollView.delegate = self
        self.innerContainerScrollView.pagingEnabled = true
        self.innerContainerScrollView.scrollEnabled = true
        self.innerContainerScrollView.directionalLockEnabled = true
        self.innerContainerScrollView.showsHorizontalScrollIndicator = true
        self.innerContainerScrollView.showsVerticalScrollIndicator = false
        self.innerContainerScrollView.bounces = true
        self.innerContainerScrollView.scrollsToTop = false
        
    }
    
    //スクロールを検知した際に行われる処理
    func scrollViewDidScroll(scrollview: UIScrollView) {
        
        //画像の位置から画像の番号を判別する
        let pageWidth: CGFloat = (CGFloat)(self.innerContainerScrollView.frame.size.width)
        let fractionalPage: Double = Double(self.innerContainerScrollView.contentOffset.x / pageWidth)
        let page: Int = Int(lround(fractionalPage))
        
        //ページ判定を行う（上のラベル上に配置したボタンに関しての判定）
        self.changeStatusWhenScroll(page)
        
    }
    
    //enumのステータスを変更する＆ボタンの見た目を変更する
    func changeStatusWhenScroll(page: Int) {
        
        if (page == ListStatus.NowOpened.toListControlNumber()) {
            
            self.currentStatus = ListStatus.NowOpened
            
            //ボタンステータスの変更
            self.nowOpenButton.alpha      = self.activeValue
            self.nowHereButton.alpha      = self.inactiveValue
            self.visitHistoryButton.alpha = self.inactiveValue
            
            self.nowOpenButton.enabled      = false
            self.nowHereButton.enabled      = true
            self.visitHistoryButton.enabled = true
            
        } else if (page == ListStatus.AlreadyGone.toListControlNumber()) {
            
            self.currentStatus = ListStatus.AlreadyGone

            //ボタンステータスの変更
            self.nowOpenButton.alpha      = self.inactiveValue
            self.nowHereButton.alpha      = self.inactiveValue
            self.visitHistoryButton.alpha = self.activeValue
            
            self.nowOpenButton.enabled      = true
            self.nowHereButton.enabled      = true
            self.visitHistoryButton.enabled = false
            
        } else if (page == ListStatus.StayingHere.toListControlNumber()) {
            
            self.currentStatus = ListStatus.StayingHere
            
            //ボタンステータスの変更
            self.nowOpenButton.alpha      = self.inactiveValue
            self.nowHereButton.alpha      = self.activeValue
            self.visitHistoryButton.alpha =  self.inactiveValue
            
            self.nowOpenButton.enabled      = true
            self.nowHereButton.enabled      = false
            self.visitHistoryButton.enabled = true
        }
        
    }
    
    //ScrollView内のコンテンツのoffset値の変更
    func changeContainerOffsetWhenButtonPush(page: Int) {
        
        //アニメーション位置を決める
        UIView.animateWithDuration(0.45, delay: 0, options: [], animations: {
            
            self.innerContainerScrollView.contentOffset = CGPointMake(
                CGFloat(Int(self.view.frame.size.width) * page),
                CGFloat(0.0)
            )
            
        }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
