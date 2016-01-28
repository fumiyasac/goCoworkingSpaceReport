//
//  HotelController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2016/01/11.
//  Copyright © 2016年 just1factory. All rights reserved.
//

import UIKit

class HotelController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //ヒット数とオフセット数（オフセット数は使うかは不明）
    @IBOutlet var resultHitCount: UILabel!
    @IBOutlet var resultHitOffset: UILabel!

    //結果表示用のテーブルビュー
    @IBOutlet var resultTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数（現在は決め打ち）
    let cellCount: Int = 10
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 150.0
    
    override func viewWillAppear(animated: Bool) {
        
        self.resultTableView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(142),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DeviceSize.screenHeight() - 142)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデリゲート
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "TravelCell", bundle: nil)
        self.resultTableView.registerNib(nibDefault, forCellReuseIdentifier: "TravelCell")
    }

    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return self.sectionCount
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セクションのセル数
        return self.cellCount
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Xibファイルを元にデータを作成する
        let cell = tableView.dequeueReusableCellWithIdentifier("TravelCell") as? TravelCell
        
        return cell!
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //@todo: go some controller...
        print("HotelTableViewTapped!")
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
