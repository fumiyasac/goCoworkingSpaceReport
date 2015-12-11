//
//  FeaturedPopupUnitController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/06.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class FeaturedPopupUnitController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {

    //遷移元から送られてきたDictionary
    var featuredDataList: [String : String]!
    
    //リンクURLを格納する配列
    var targetLinkArray: NSMutableArray!
    
    //詳細ページからもらう値を入れる変数
    var featuredId : Int! = 0
    var featuredTitle : String! = ""
    var featuredImage: String! = ""
    var featuredCategory: String! = ""
    var featuredText: String! = ""
    var featuredLink: String! = ""
    
    //コンテナの最大数
    let maxFeatured: Int! = 2
    
    //ScrollViewのサイズ
    let featuredContentWidth: Int = DeviceSize.screenWidth() - 20
    let featuredContentHeight: Int = DeviceSize.screenHeight() - 188
    
    //配置したインスタンス群
    @IBOutlet var featuredCloseBtn: UIButton!
    @IBOutlet var featuredScrollViewContents: UIScrollView!
    @IBOutlet var featuredScrollPage: UIPageControl!
    @IBOutlet var featuredLinkBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        
        self.featuredScrollViewContents.frame = CGRectMake(
            CGFloat(10),
            CGFloat(100),
            CGFloat(self.featuredContentWidth),
            CGFloat(self.featuredContentHeight)
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールビューデリゲート
        self.featuredScrollViewContents.delegate = self
        self.featuredScrollViewContents.contentSize = CGSizeMake(
            CGFloat(self.featuredContentWidth * (self.maxFeatured + 1)),
            CGFloat(self.featuredContentHeight)
        )
        
        //スクロールビュー初期設定
        self.featuredScrollViewContents.pagingEnabled = true
        self.featuredScrollViewContents.scrollEnabled = true
        self.featuredScrollViewContents.directionalLockEnabled = true
        self.featuredScrollViewContents.showsHorizontalScrollIndicator = false
        self.featuredScrollViewContents.showsVerticalScrollIndicator = false
        self.featuredScrollViewContents.bounces = true
        self.featuredScrollViewContents.scrollsToTop = false
        
        //ページコントロール初期設定
        self.featuredScrollPage.currentPage = 0
        self.featuredScrollPage.numberOfPages = (self.maxFeatured + 1)
        
        //コンテナの配置
        for i in 0...maxFeatured {
            
            //@todo: 配置時にリンクURLを格納した配列を作成する
            
            let featuredScrollViewInnerWidth: Int = self.featuredContentWidth * i
            
            let featuredImageView: UIImageView! = UIImageView()
            self.featuredScrollViewContents.addSubview(featuredImageView)
            
            featuredImageView.frame = CGRectMake(
                CGFloat(featuredScrollViewInnerWidth),
                CGFloat(0.0),
                CGFloat(self.featuredContentWidth),
                CGFloat(self.featuredContentHeight)
            )
            featuredImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.LightGray.rawValue)

            let featuredBackground: UILabel! = UILabel()
            let featuredTitle: UILabel! = UILabel()
            let featuredCategory: UILabel! = UILabel()
            let featuredDescription: UITextView! = UITextView()
            let featuredButton: UIButton! = UIButton()
            
            self.featuredScrollViewContents.addSubview(featuredBackground)
            self.featuredScrollViewContents.addSubview(featuredTitle)
            self.featuredScrollViewContents.addSubview(featuredCategory)
            self.featuredScrollViewContents.addSubview(featuredDescription)
            self.featuredScrollViewContents.addSubview(featuredButton)
            
            featuredBackground.frame = CGRectMake(
                CGFloat(featuredScrollViewInnerWidth),
                CGFloat(self.featuredContentHeight - 80),
                CGFloat(self.featuredContentWidth),
                CGFloat(80)
            )
            featuredBackground.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Black.rawValue)
            featuredBackground.alpha = 0.5
            
            featuredTitle.frame = CGRectMake(
                CGFloat(featuredScrollViewInnerWidth + 5),
                CGFloat(self.featuredContentHeight - 76),
                CGFloat(self.featuredContentWidth - 10),
                CGFloat(20)
            )
            featuredTitle.font = UIFont.boldSystemFontOfSize(12.0)
            featuredTitle.textColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
            featuredTitle.text = "テキストテキストテキスト"

            featuredCategory.frame = CGRectMake(
                CGFloat(featuredScrollViewInnerWidth + 5),
                CGFloat(self.featuredContentHeight - 58),
                CGFloat(self.featuredContentWidth - 10),
                CGFloat(20)
            )
            featuredCategory.font = UIFont.boldSystemFontOfSize(12.0)
            featuredCategory.textColor = ColorDefinition.colorWithHexString(ColorStatus.Yellow.rawValue)
            featuredCategory.text = "カテゴリー"
            
            featuredDescription.frame = CGRectMake(
                CGFloat(featuredScrollViewInnerWidth),
                CGFloat(self.featuredContentHeight - 44),
                CGFloat(self.featuredContentWidth),
                CGFloat(44)
            )
            featuredDescription.editable = false
            featuredDescription.selectable = false
            featuredDescription.bounces = false
            featuredDescription.scrollEnabled = false
            featuredDescription.font = UIFont.systemFontOfSize(11.0)
            featuredDescription.backgroundColor = UIColor.clearColor()
            featuredDescription.textColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
            featuredDescription.text = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
            
            let linkButtonInnerPosx: Int = self.featuredContentWidth * (i + 1) - 145
            featuredButton.frame = CGRectMake(
                CGFloat(linkButtonInnerPosx),
                CGFloat(self.featuredContentHeight - 110),
                CGFloat(140),
                CGFloat(30)
            )
            featuredButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
            featuredButton.titleLabel?.font = UIFont.boldSystemFontOfSize(13.0)
            featuredButton.setTitleColor(ColorDefinition.colorWithHexString(ColorStatus.White.rawValue), forState: .Normal)
            featuredButton.setTitle("● 記事の詳細を見る", forState: .Normal)
            featuredButton.tag = i
            featuredButton.addTarget(self, action: "featuredButtonTapped:", forControlEvents: .TouchUpInside)
        }
        
    }
    
    //スクロールを検知した際に行われる処理
    func scrollViewDidScroll(scrollview: UIScrollView) {
        
        //画像の位置から画像の番号を判別する
        let pageWidth: CGFloat = self.featuredScrollViewContents.frame.size.width
        let fractionalPage: Double = Double(self.featuredScrollViewContents.contentOffset.x / pageWidth)
        let page: NSInteger = lround(fractionalPage)
        self.featuredScrollPage.currentPage = page;
    }
    
    //「記事の詳細を見る」ボタンをタップした時のアクション
    func featuredButtonTapped(button: UIButton){
        
        //@todo:タグに該当する配列のリンクをSafariで表示
        
        //コンソール表示
        print("Featured Number \(button.tag) is Tapped.")
    }
    
    //「特集記事をもっと見る」ボタンをタップした時のアクション
    @IBAction func goFeaturedAction(sender: UIButton) {
        
        //コンソール表示
        print("Featured List Button is Tapped.")
        
    }
    
    @IBAction func closeBtnAction(sender: UIButton) {
        
        //押されたらポップアップ状態から消す
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
