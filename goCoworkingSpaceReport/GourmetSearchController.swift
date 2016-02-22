//
//  GourmetSearchController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/14.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class GourmetSearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //選択状態
    var status: GourmetStatus!
    
    //ヒット数とオフセット数（オフセット数は使うかは不明）
    @IBOutlet var resultHitCount: UILabel!
    @IBOutlet var resultHitOffset: UILabel!
    
    //キーワード検索バー
    @IBOutlet var gourmetSearchBar: UISearchBar!
    
    //セグメントコントーロール
    @IBOutlet var searchSegmentControl: UISegmentedControl!
    
    //結果表示用テーブルビュー
    @IBOutlet var resultTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数（現在は決め打ち）
    let cellCount: Int = 10
    
    //検索結果用の変数
    var searchTargetText: String! = ""
    var gourmetServiceText: String! = "gnavi"
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 220.0
    
    override func viewWillAppear(animated: Bool) {
        
        //初期位置
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
        
        //API読み込み試験
        self.reloadGourmetApiData(GourmetStatus.SelectGnavi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SegmentControlの初期値
        self.status = GourmetStatus.SelectGnavi
        self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
        
        //検索バーのデリゲート
        self.gourmetSearchBar.delegate = self
        self.gourmetSearchBar.showsCancelButton = true
        self.gourmetSearchBar.placeholder = "キーワードを入力"
        self.gourmetSearchBar.tintColor = ColorDefinition.colorWithHexString(ColorStatus.Brown.rawValue)
        
        //テーブルビューのデリゲート
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "GourmetCell", bundle: nil)
        self.resultTableView.registerNib(nibDefault, forCellReuseIdentifier: "GourmetCell")
        
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

        //掲載サービス名
        cell!.gourmetService.text = "ぐるなび"
        cell!.gourmetService.textColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
        
        //セルのアクセサリタイプと背景の設定
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell!
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //@todo: go some controller...
        print("GourmetTableViewTapped!")
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    //テーブルビューをリロードする
    func reloadData() {
        self.resultTableView.reloadData()
    }
    
    //---------- 2. SegmentControl ----------
    //セグメントコントロールで切り替えを行う
    @IBAction func changeGourmetApi(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.status = GourmetStatus.SelectGnavi
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
            self.gourmetServiceText = GourmetStatus.SelectGnavi.returnValue()
        case 1:
            self.status = GourmetStatus.SelectHotPepper
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.HotPepperColor.rawValue)
            self.gourmetServiceText = GourmetStatus.SelectHotPepper.returnValue()
        default:
            self.status = GourmetStatus.SelectGnavi
            self.searchSegmentControl.tintColor = ColorDefinition.colorWithHexString(ColorStatus.GnaviColor.rawValue)
            self.gourmetServiceText = GourmetStatus.SelectGnavi.returnValue()
        }
        
        //@todo: APIからデータを取得してAPIでの検索結果を再度描画する（CakePHP側で作成したもの）
    }
    
    //---------- 3. APIデータのリロードの処理 ----------
    //Api取得データをリロードする
    func reloadGourmetApiData(status: GourmetStatus) {
        
        let gourmetUrlString = RelatedDataUri.GourmetDataUriTest.rawValue
        
        let url = NSURL(string: gourmetUrlString)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url,
            completionHandler: { data, response, error in
                
                do {
                    
                    //JSONデータを辞書に変換する
                    let json = try NSJSONSerialization.JSONObjectWithData(data!,
                        options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    //各々のデータを取得する
                    let per_page: Int = Int((json.objectForKey("per_page") as? String)!)!
                    print(per_page)
                    
                    let total: Int = Int((json.objectForKey("total") as? String)!)!
                    print(total)

                    let offset: Int = Int((json.objectForKey("offset") as? String)!)!
                    print(offset)
                    
                    let shops: NSDictionary = (json.objectForKey("shop") as? NSDictionary)!
                    print(shops)
                    
                    for shop in shops {
                        
                        //店舗情報データを取得する
                        let shopDic: AnyObject = shop.value
                        
                        //例.名前を取得する場合
                        let name: String = (shopDic.objectForKey("name") as? String)!
                        print(name)
                    }
                    
                } catch {
                    
                    //例外が飛んでしまった時の処理を記載
                    
                }
                
                //メインスレッドにスイッチする
                dispatch_async(dispatch_get_main_queue(), {
                    
                    //テーブルビューを更新する
                    self.reloadData()
                    
                }) //タスク完了時
        })
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
