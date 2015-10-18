//
//  ViewController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/24.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

class ViewController: UIViewController, UIScrollViewDelegate {

    //Debug.
    @IBOutlet var debugLabel: UILabel!
    
    //オープニング画像スクロールビュー
    @IBOutlet var openingScrollView: UIScrollView!
    
    //ページコントロール
    @IBOutlet var pageControl: UIPageControl!
    
    //はじめるボタン
    @IBOutlet var startButton: UIButton!
    
    //ページ数
    let pageNumber = 2;
    
    //スクロールビューにセットする画像
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Parseテスト用のコード（Object has been saved.がコンソールに表示されれば通信が成功）
        /*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        */

        //スクロールビューの設定
        self.openingScrollView.contentSize = CGSizeMake(
            CGFloat(DeviceSize.screenWidth() * (self.pageNumber + 1)),
            CGFloat(DeviceSize.screenHeight())
        )
        
        // ページコントロールの初期値設定
        self.pageControl.currentPage = 0
        
        // ページするオプションを有効にするための設定（今回は縦にスクロール）
        self.openingScrollView.delegate = self
        self.openingScrollView.pagingEnabled = true
        self.openingScrollView.scrollEnabled = true
        self.openingScrollView.directionalLockEnabled = true
        self.openingScrollView.showsHorizontalScrollIndicator = false
        self.openingScrollView.showsVerticalScrollIndicator = true
        self.openingScrollView.bounces = true
        self.openingScrollView.scrollsToTop = false
        
        //UIImageViewを3つ作成してScrollViewへ追加
        let firstImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: DeviceSize.screenWidth(), height: DeviceSize.screenHeight()))
        firstImageView.image = self.image1
        firstImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test1.rawValue)
        self.openingScrollView.addSubview(firstImageView)
        
        let secondImageView = UIImageView(frame: CGRect(x: DeviceSize.screenWidth(), y: 0, width: DeviceSize.screenWidth(), height: DeviceSize.screenHeight()))
        secondImageView.image = self.image2
        secondImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test2.rawValue)
        self.openingScrollView.addSubview(secondImageView)
        
        let thirdImageView = UIImageView(frame: CGRect(x: DeviceSize.screenWidth() * 2, y: 0, width: DeviceSize.screenWidth(), height: DeviceSize.screenHeight()))
        thirdImageView.image = self.image3
        thirdImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test3.rawValue)
        self.openingScrollView.addSubview(thirdImageView)
    }
    
    //スクロールを検知した際に行われる処理
    func scrollViewDidScroll(scrollview: UIScrollView) {
        
        //画像の位置から画像の番号を判別する
        let pageWidth: CGFloat = self.openingScrollView.frame.size.width
        let fractionalPage: Double = Double(self.openingScrollView.contentOffset.x / pageWidth)
        let page: NSInteger = lround(fractionalPage)
        self.pageControl.currentPage = page;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
