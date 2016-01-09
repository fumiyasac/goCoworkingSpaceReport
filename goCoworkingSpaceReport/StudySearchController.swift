//
//  StudySearchController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/15.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class StudySearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //選択状態
    var status: StudyAndEventStatus!
    
    //ヒット数とオフセット数（オフセット数は使うかは不明）
    @IBOutlet var resultHitCount: UILabel!
    @IBOutlet var resultHitOffset: UILabel!
    
    //キーワード検索バー
    @IBOutlet var studySearchBar: UISearchBar!
    
    //セグメントコントーロール
    @IBOutlet var searchSegmentControl: UISegmentedControl!
    
    //結果表示用テーブルビュー
    @IBOutlet var resultTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数
    let cellCount: Int = 20
    
    //検索結果用の変数
    var searchTargetText: String! = ""
    var studyAndEventServiceText: String! = "connpass"
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 110.0
    
    override func viewWillAppear(animated: Bool) {
        
        self.searchSegmentControl.frame = CGRectMake(
            CGFloat(10),
            CGFloat(115),
            CGFloat(DeviceSize.screenWidth() - 20),
            CGFloat(30)
        )
        
        self.resultTableView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(188),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DeviceSize.screenHeight() - 188)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SegmentControlの初期値
        self.status = StudyAndEventStatus.SelectConpass
        self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.ConpassColor.rawValue)
        
        //検索バーのデリゲート
        self.studySearchBar.delegate = self
        self.studySearchBar.showsCancelButton = true
        self.studySearchBar.placeholder = "キーワードを入力"
        self.studySearchBar.tintColor = ColorDefinition.colorWithHexString(ColorStatus.Brown.rawValue)
        
        //テーブルビューのデリゲート
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "EventAndStudyCell", bundle: nil)
        self.resultTableView.registerNib(nibDefault, forCellReuseIdentifier: "EventAndStudyCell")
        
    }
    
    //検索バーのキャンセルボタンがクリックされた場合
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        //キーボードを隠す
        self.view.endEditing(true)
    }
    
    //検索バーで検索ボタンが押された場合の処理
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchTargetText = searchText
        
        //@todo: APIからデータを取得してAPIでの検索結果を再度描画する（CakePHP側で作成したもの）
        
        
        //キーボードを隠す
        self.view.endEditing(true)
        
        //@future: これまでの検索結果からSuggest機能をつける（v1.0では実装しないのでv1.1以降）
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
        let cell = tableView.dequeueReusableCellWithIdentifier("EventAndStudyCell") as? EventAndStudyCell
        
        //テキスト・画像等の表示
        cell!.scheduleEvent.text = "2015.12.15"
        cell!.siteEvent.text = "Connpass"
        cell!.siteEvent.textColor = ColorDefinition.colorWithHexString(ColorStatus.ConpassColor.rawValue)
        cell!.siteEvent.backgroundColor = UIColor.clearColor()
        cell!.dateEvent.text = "（開催時間）14:00〜18:00"
        cell!.titleEvent.text = "勉強会タイトル勉強会タイトル勉強会タイトル勉強会タイトル勉強会タイトル"
        
        //セルのアクセサリタイプと背景の設定
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
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
        self.resultTableView.reloadData()
    }
    
    //---------- 2. SegmentControl ----------
    //セグメントコントロールで切り替えを行う
    @IBAction func changeEventAndStudyApi(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.status = StudyAndEventStatus.SelectConpass
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.ConpassColor.rawValue)
            self.studyAndEventServiceText = StudyAndEventStatus.SelectConpass.returnValue()
        case 1:
            self.status = StudyAndEventStatus.SelectDoorkeeper
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.DoorkeeperColor.rawValue)
            self.studyAndEventServiceText = StudyAndEventStatus.SelectDoorkeeper.returnValue()
        default:
            self.status = StudyAndEventStatus.SelectConpass
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.ConpassColor.rawValue)
            self.studyAndEventServiceText = StudyAndEventStatus.SelectConpass.returnValue()
        }
        
    }
    
    //---------- 3. APIデータのリロードの処理 ----------
    //Api取得データをリロードする
    func reloadStudyAndEventApiData(status: StudyAndEventStatus) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
