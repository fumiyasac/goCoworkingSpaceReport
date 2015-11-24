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

//Realmクラスのインポート
import Realm

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
    let pageNumber = 2
    
    //スクロールビューにセットする画像
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //Parseテスト用のコード（Object has been saved.がコンソールに表示されれば通信が成功）
        /*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        */

        //Realmクラスのテスト用のコード（Realmのデフォルトパス[(以下略)/Documents/default.realm]がコンソールに表示されれば通信が成功）
        /*
        print(RLMRealm.defaultRealmPath())
        */

        //スクロールビューの設定
        self.openingScrollView.contentSize = CGSizeMake(
            CGFloat(DeviceSize.screenWidth() * (self.pageNumber + 1)),
            CGFloat(DeviceSize.screenHeight())
        )
        
        // ページコントロールの初期値設定
        self.pageControl.currentPage = 0
        
        // ページするオプションを有効にするための設定（今回は横にスクロール）
        self.openingScrollView.delegate = self
        self.openingScrollView.pagingEnabled = true
        self.openingScrollView.scrollEnabled = true
        self.openingScrollView.directionalLockEnabled = true
        self.openingScrollView.showsHorizontalScrollIndicator = false
        self.openingScrollView.showsVerticalScrollIndicator = true
        self.openingScrollView.bounces = true
        self.openingScrollView.scrollsToTop = false
        
        //UIImageViewを3つ作成してScrollViewへ追加
        for i in 0...self.pageNumber {

            let targetImageView = UIImageView(
                frame: CGRect(
                    x: DeviceSize.screenWidth()*i,
                    y: 0,
                    width: DeviceSize.screenWidth(),
                    height: DeviceSize.screenHeight()
                )
            )
            self.openingScrollView.addSubview(targetImageView)

            //画像の設定変更
            if (i == 0) {
                targetImageView.image = self.image1
                targetImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test1.rawValue)
            } else if (i == 1) {
                targetImageView.image = self.image2
                targetImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test2.rawValue)
            } else if (i == 2) {
                targetImageView.image = self.image3
                targetImageView.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Test3.rawValue)
            }

        }

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
