//
//  StudySearchController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/15.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class StudySearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    //選択状態
    var status: StudyAndEventStatus!
    
    //キーワード検索バー
    @IBOutlet var searchKeywordField: UITextField!
    
    //ヒット数とオフセット数（オフセット数は使うかは不明）
    @IBOutlet var resultHitCount: UILabel!
    @IBOutlet var resultHitOffset: UILabel!
    
    //検索ボタン
    @IBOutlet var searchBtn: UIButton!
    
    //セグメントコントーロール
    @IBOutlet var searchSegmentControl: UISegmentedControl!
    
    //結果表示用テーブルビュー
    @IBOutlet var resultTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数
    let cellCount: Int = 16
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 110.0
    
    override func viewWillAppear(animated: Bool) {
        
        //初期位置
        self.searchKeywordField.frame = CGRectMake(
            CGFloat(10),
            CGFloat(73),
            CGFloat(DeviceSize.screenWidth() - 95),
            CGFloat(30)
        )
        
        self.searchSegmentControl.frame = CGRectMake(
            CGFloat(10),
            CGFloat(108),
            CGFloat(DeviceSize.screenWidth() - 95),
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
        
        //テキストフィールドのデリゲート
        self.searchKeywordField.delegate = self
        self.searchKeywordField.placeholder = "キーワードを入力して下さい"
        self.searchKeywordField.clearButtonMode = .Always
        
        //ボタンの角丸をつける
        self.searchBtn.layer.cornerRadius = CGFloat(5.0)
        
        //テーブルビューのデリゲート
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "EventAndStudyCell", bundle: nil)
        self.resultTableView.registerNib(nibDefault, forCellReuseIdentifier: "EventAndStudyCell")
        
    }

    //タップしてキーボードを引っ込める
    @IBAction func backgroundTappedAction(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
    
    /*
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    var headerViewBase: UIView?
    
    //ヘッダーが必要な物はここにaddSubView
    switch (section) {
    
    case DetailTableDefinition.EveryoneGalleryHeaderOnly.returnValue():
    
    //@todo: Header用のContainerを突っ込む
    headerViewBase = UIView()
    headerViewBase?.addSubview(self.userThumbContainer)
    headerViewBase?.frame = CGRectMake(
    CGFloat(0),
    CGFloat(0),
    CGFloat(DeviceSize.screenWidth()),
    CGFloat(DetailTableDefinition.EveryoneGalleryHeaderOnly.sectionHeaderHeight())
    )
    return headerViewBase
    
    case DetailTableDefinition.SocialButtonHeaderOnly.returnValue():
    
    //@todo: Social連携等のボタンを配置したものを突っ込む
    
    headerViewBase = UIView()
    headerViewBase?.addSubview(self.portfolioThumbContainer)
    headerViewBase?.frame = CGRectMake(
    CGFloat(0),
    CGFloat(0),
    CGFloat(DeviceSize.screenWidth()),
    CGFloat(DetailTableDefinition.SocialButtonHeaderOnly.sectionHeaderHeight())
    )
    return headerViewBase
    
    default:
    headerViewBase = nil
    return headerViewBase
    }
    
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
    //セクションヘッダー高
    switch (section) {
    
    case DetailTableDefinition.EveryoneGalleryHeaderOnly.returnValue():
    return CGFloat(DetailTableDefinition.EveryoneGalleryHeaderOnly.sectionHeaderHeight())
    
    case DetailTableDefinition.SocialButtonHeaderOnly.returnValue():
    return CGFloat(DetailTableDefinition.SocialButtonHeaderOnly.sectionHeaderHeight())
    
    default:
    return CGFloat(0.0)
    }
    }
    */
    
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
        case 1:
            self.status = StudyAndEventStatus.SelectDoorkeeper
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.DoorkeeperColor.rawValue)
        default:
            self.status = StudyAndEventStatus.SelectConpass
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.ConpassColor.rawValue)
        }
        
    }
    
    //---------- 3. 検索ボタン押下時の処理 ----------
    //検索ボタンが押された際のアクション
    @IBAction func searchApiAction(sender: UIButton) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
