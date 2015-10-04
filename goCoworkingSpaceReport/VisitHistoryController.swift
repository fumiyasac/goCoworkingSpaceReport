//
//  VisitHistoryController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

class VisitHistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var visitHistoryTableView: UITableView!
    
    //コレクションビューの要素数
    let sectionCount: Int = 1
    
    //コレクションビューのセル数
    let cellCount: Int = 16
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellDefaultHeight: CGFloat  = 80.0
    let cellSelectedHeight: CGFloat = 280.0
    
    var selectedIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //デリゲート
        self.visitHistoryTableView.delegate = self;
        self.visitHistoryTableView.dataSource = self;
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "HistoryCell", bundle: nil)
        self.visitHistoryTableView.registerNib(nibDefault, forCellReuseIdentifier: "HistoryCell")
        let nibSelected:UINib = UINib(nibName: "HistoryTappedCell", bundle: nil)
        self.visitHistoryTableView.registerNib(nibSelected, forCellReuseIdentifier: "HistoryTappedCell")
        
        //選択状態は初期値nil
        self.selectedIndexPath = nil;
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
        
        //開閉の制御をするための条件分岐
        if(self.targetCellSelected(indexPath)){
            
            //Xibファイルを元にデータを作成する
            let cell = tableView.dequeueReusableCellWithIdentifier("HistoryTappedCell") as? HistoryTappedCell;
            
            //テキスト・画像等の表示
            cell!.dateLabel.text = "Date:2015.10.04"
            cell!.spaceTitleLabel.text = "場所:コワーキングスペースCo-Edo"
            let shopImagePath = UIImage(named: "coedo.jpg")
            cell!.spaceImageSmall.image = shopImagePath
            
            cell!.checkInLabel.text  = "2015/10/04 10:00"
            cell!.checkOutLabel.text = "2015/10/04 18:00"
            cell!.textMemo.text = "今日はSwiftビギナーズ勉強会にお越しいただき誠にありがとうございます！"
            
            //セルのアクセサリタイプと背景の設定
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            cell!.selectionStyle = UITableViewCellSelectionStyle.None;
            
            return cell!
            
        }else{
            
            //Xibファイルを元にデータを作成する
            let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as? HistoryCell;
            
            //テキスト・画像等の表示
            cell!.dateLabel.text = "Date:2015.10.04"
            cell!.spaceTitleLabel.text = "場所:コワーキングスペースCo-Edo"
            let shopImagePath = UIImage(named: "coedo.jpg")
            cell!.spaceImageSmall.image = shopImagePath
            
            //セルのアクセサリタイプと背景の設定
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            cell!.selectionStyle = UITableViewCellSelectionStyle.None;
            
            return cell!
        }
        
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (self.targetCellSelected(indexPath)) {
            self.selectedIndexPath = nil;
        } else {
            self.selectedIndexPath = indexPath;
        }
        self.reloadData();
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(self.targetCellSelected(indexPath)){
            return cellSelectedHeight
        }else{
            return cellDefaultHeight
        }
    }
    
    //トグルさせるビューを決定する
    func targetCellSelected(tagetIndexPath: NSIndexPath) -> Bool {
        
        if(self.selectedIndexPath != nil
            && tagetIndexPath.row == self.selectedIndexPath!.row
            && tagetIndexPath.section == self.selectedIndexPath!.section){
                return true
        }else{
            return false
        }
    }
    
    //テーブルビューをリロードする
    func reloadData(){
        self.visitHistoryTableView.reloadData()
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
