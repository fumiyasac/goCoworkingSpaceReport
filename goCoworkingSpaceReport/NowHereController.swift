//
//  NowHereController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

class NowHereController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var nowHereTableView: UITableView!
    
    //コレクションビューの要素数
    let sectionCount: Int = 1
    
    //コレクションビューのセル数
    let cellCount: Int = 16
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 140.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //デリゲート
        self.nowHereTableView.delegate = self
        self.nowHereTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "NowHereCell", bundle: nil)
        self.nowHereTableView.registerNib(nibDefault, forCellReuseIdentifier: "NowHereCell")
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
        let cell = tableView.dequeueReusableCellWithIdentifier("NowHereCell") as? NowHereCell
        
        //テキスト・画像等の表示
        let shopImagePath = UIImage(named: "coedo.jpg")
        cell!.spaceImageMedium.image = shopImagePath
        
        cell!.statusLabel.text = "Coworking"
        cell!.spaceTitle.text = "コワーキングスペースCo-Edo"
        cell!.usernameLabel.text = "Fumiya Sakaiさん"
        cell!.checkText.text = "現在上の場所でお仕事or勉強しています(^^)"
        
        //セルのアクセサリタイプと背景の設定
        cell!.accessoryType = UITableViewCellAccessoryType.None
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell!
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //@todo: go some controller...
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
    
    //テーブルビューをリロードする
    func reloadData(){
        self.nowHereTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
