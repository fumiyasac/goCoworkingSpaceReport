//
//  GourmetSearchController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/14.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class GourmetSearchController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {

    //選択状態
    var status: GourmetStatus!
    
    //キーワード検索バー
    @IBOutlet var searchKeywordField: UITextField!
    
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
    let cellHeight: CGFloat = 200.0
    
    override func viewWillAppear(animated: Bool) {
        
        //初期位置
        self.searchKeywordField.frame = CGRectMake(
            CGFloat(10),
            CGFloat(75),
            CGFloat(DeviceSize.screenWidth() - 95),
            CGFloat(30)
        )
        
        self.searchSegmentControl.frame = CGRectMake(
            CGFloat(10),
            CGFloat(112),
            CGFloat(DeviceSize.screenWidth() - 95),
            CGFloat(30)
        )
        
        self.resultTableView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(150),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DeviceSize.screenHeight() - 150)
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SegmentControlの初期値
        self.status = GourmetStatus.SelectGnavi
        self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
        
        //テキストフィールドのデリゲート
        self.searchKeywordField.delegate = self
        self.searchKeywordField.placeholder = "キーワードを入力して下さい"
        
        //ボタンの角丸をつける
        self.searchBtn.layer.cornerRadius = CGFloat(5.0)
        
        //テーブルビューのデリゲート
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "GourmetCell", bundle: nil)
        self.resultTableView.registerNib(nibDefault, forCellReuseIdentifier: "GourmetCell")
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("GourmetCell") as? GourmetCell
        
        //テキスト・画像等の表示
        cell!.gourmetTitle.text = "お店名"
        cell!.gourmetCategory.text = "カテゴリー"
        cell!.gourmetTel.text = "☎︎" + "03-1234-5678"
        cell!.gourmetAddress.text = "東京都中央区新川"

        cell!.gourmetBudget.editable = false
        cell!.gourmetBudget.dataDetectorTypes = .Link
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineHeightMultiple = 1.7
        
        do {
            
            let htmlText: String = "<strong style=\"color:#ff9900;\">こんな風に表示：</strong><br>「900円」「フリー2500円　宴会3500円」など"
            let encodedData = htmlText.dataUsingEncoding(NSUTF8StringEncoding)!
            let attributedOptions : [String : AnyObject] = [
                NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding,
                NSParagraphStyleAttributeName : paragraph
            ]
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            
            cell!.gourmetBudget.attributedText = attributedString
            
        } catch {
            fatalError("Unhandled error: \(error)")
        }

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
    @IBAction func changeGourmetApi(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.status = GourmetStatus.SelectGnavi
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
        case 1:
            self.status = GourmetStatus.SelectHotPepper
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.HotPepperColor.rawValue)
        default:
            self.status = GourmetStatus.SelectGnavi
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
        }
        
    }
    
    //---------- 3. 検索ボタン押下時の処理 ----------
    //検索ボタンが押された際のアクション
    @IBAction func searchApiAction(sender: UIButton) {
        
        
    }
    
    //Api取得データをリロードする
    func reloadApiData(status: GourmetStatus) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
