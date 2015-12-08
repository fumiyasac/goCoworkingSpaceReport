//
//  PortfolioController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/01.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class PortfolioController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //コレクションビューのセクション・セル・高さ
    let collectionViewSectionCount: Int = 1
    let collectionViewCellCount: Int = 8
    let collectionViewCellHeight: CGFloat = 160.0
    
    @IBOutlet var portfolioCollectionView: UICollectionView!
    
    override func viewWillAppear(animated: Bool) {
        self.portfolioCollectionView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(50),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DetailTableDefinition.SocialButtonHeaderOnly.sectionHeaderHeight()-50)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート
        self.portfolioCollectionView.delegate = self;
        self.portfolioCollectionView.dataSource = self;
        
        //セルの読み込み
        let nib:UINib = UINib(nibName: "PortfolioCollectionViewCell", bundle: nil)
        self.portfolioCollectionView.registerNib(nib, forCellWithReuseIdentifier: "PortfolioCell")
    }
    
    //コレクションビューの要素数を設定する ※必須
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return self.collectionViewSectionCount
    }
    
    //コレクションビューの行数を設定する ※必須
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        return self.collectionViewCellCount
    }
    
    //コレクションビューのセルサイズを格納 ※任意（今回はおのおのの画像サイズを切り出すのでこんな感じの対応）
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        
        return CGSizeMake(CGFloat(DeviceSize.screenWidth()*2/3), 160);
    }
    
    //表示するセルの中身を設定する ※必須
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell! = collectionView.dequeueReusableCellWithReuseIdentifier("PortfolioCell", forIndexPath: indexPath) as? PortfolioCollectionViewCell;
        
        return cell!
    }
    
    //セルをタップした時に呼び出される
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let tappedIndex: Int! = indexPath.row
        print("----- Portfolio Number of \(tappedIndex) is tapped. -----")
        
        //@todo: 処理記載（tappedIndexの値をキーとしてWordPressのデータをCakePHPでマージしたAPIより取得した画像などのデータを持ってくる）
        
        /* 実際の値の渡し方の一例：
        photoPopup.photoUserNameLbl.text = "fumiyasac"
        */
        
        //詳細データを遷移先へ引き渡す処理
        let portfolioPopup:PortfolioPopupUnitController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PortfolioPopup") as! PortfolioPopupUnitController
        
        self.presentViewController(portfolioPopup, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
