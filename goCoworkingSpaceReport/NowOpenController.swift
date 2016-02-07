//
//  NowOpenController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class NowOpenController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var nowOpenTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数
    let cellCount: Int = 16
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 150.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //デリゲート
        self.nowOpenTableView.delegate = self
        self.nowOpenTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "NowOpenCell", bundle: nil)
        self.nowOpenTableView.registerNib(nibDefault, forCellReuseIdentifier: "NowOpenCell")
    }

    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return sectionCount
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セクションのセル数
        return cellCount
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Xibファイルを元にデータを作成する
        let cell = tableView.dequeueReusableCellWithIdentifier("NowOpenCell") as? NowOpenCell
            
        //テキスト・画像等の表示
        let shopImagePath = UIImage(named: "coedo.jpg")
        cell!.spaceImageMedium.image = shopImagePath
        
        cell!.spaceTitleBold.text = "コワーキングスペースCo-Edo"
        cell!.spacePlace.text = "東京メトロ茅場町駅徒歩3分"
        cell!.spaceTime.text = "平日10:00~21:00 土日祝10:00~18:00"
        
        //セルのアクセサリタイプと背景の設定
        cell!.accessoryType = UITableViewCellAccessoryType.None
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
            
        return cell!
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //@todo: detailData (Dictionary) to "sender:"
        self.parentViewController?.performSegueWithIdentifier("goNowOpenDetail", sender: nil)
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return cellHeight
    }
    
    //テーブルビューをリロードする
    func reloadData(){
        self.nowOpenTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
