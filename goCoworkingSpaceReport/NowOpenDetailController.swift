//
//  NowOpenDetailController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class NowOpenDetailController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate,UITableViewDataSource {

    //テーブルビューの要素数
    let sectionCount: Int = 7
    
    //テーブルビュー
    @IBOutlet var detailTableView: UITableView!
    
    //ユーザーの写真サムネイル用のコンテナ
    @IBOutlet var userThumbContainer: UIView!
    
    //ナビゲーションのアイテム
    var helpButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //NavigationControllerのデリゲート
        self.navigationController?.delegate = self
        
        //テーブルビュー関連設定
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        
        //ナビゲーション関連設定
        self.navigationController?.navigationBar.barTintColor = ColorDefinition.colorWithHexString(ColorStatus.Yellow.rawValue)
        self.navigationController?.navigationBar.tintColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
        
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 15)!
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        
        //Buttonを設置
        self.helpButton = UIBarButtonItem(title: "ヘルプ", style: .Plain, target: self, action: "onClickHelpButton:")
        self.navigationItem.title = ""
        self.navigationItem.rightBarButtonItem = self.helpButton
        
        //各セクション用のXibの設定
        
    }
    
    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return sectionCount
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerViewBase: UIView?
        
        //ヘッダーが必要な物はここにaddSubView
        switch (section) {
            
            case DetailTableDefinition.EverybodyPhotographHeaderOnly.returnValue():
            
                //@todo: Header用のContainerを突っ込む
                
                return headerViewBase
            
            case DetailTableDefinition.SocialButtonHeaderOnly.returnValue():
            
                //@todo: Social連携等のボタンを配置したものを突っ込む
                
                return headerViewBase
            
            default:
                headerViewBase = nil
                return headerViewBase
        }
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        //セクションヘッダー高
        switch (section) {
            
            case DetailTableDefinition.EverybodyPhotographHeaderOnly.returnValue():
                return CGFloat(DetailTableDefinition.EverybodyPhotographHeaderOnly.sectionHeaderHeight())
            
            case DetailTableDefinition.SocialButtonHeaderOnly.returnValue():
                return CGFloat(DetailTableDefinition.SocialButtonHeaderOnly.sectionHeaderHeight())
            
            default:
                return CGFloat(0.0)
        }
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Enumで設定した行数
        switch (section) {
            
            case DetailTableDefinition.CoworkingSpaceIntroductionImage.returnValue():
                return DetailTableDefinition.CoworkingSpaceIntroductionImage.sectionAmount()
            
            case DetailTableDefinition.CoworkingSpaceIntroductionText.returnValue():
                return DetailTableDefinition.CoworkingSpaceIntroductionText.sectionAmount()
            
            case DetailTableDefinition.EverybodyPhotographHeaderOnly.returnValue():
                return DetailTableDefinition.EverybodyPhotographHeaderOnly.sectionAmount()
            
            case DetailTableDefinition.DetailButtonCell.returnValue():
                return DetailTableDefinition.DetailButtonCell.sectionAmount()
            
            case DetailTableDefinition.FacebookInformation.returnValue():
                return DetailTableDefinition.FacebookInformation.sectionAmount()
            
            case DetailTableDefinition.EventAndStudyInformation.returnValue():
                return DetailTableDefinition.EventAndStudyInformation.sectionAmount()
            
            case DetailTableDefinition.SocialButtonHeaderOnly.returnValue():
                return DetailTableDefinition.SocialButtonHeaderOnly.sectionAmount()
            
            default:
                return 0
        }
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        //@todo: 読み込むXibに関する条件分岐を行う

        return cell;
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //@todo: Safariで飛ばす必要のある部分だけ処理を書く
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        //セクションセル高
        switch (indexPath.section) {
            
            case DetailTableDefinition.CoworkingSpaceIntroductionImage.returnValue():
                return CGFloat(DetailTableDefinition.CoworkingSpaceIntroductionImage.sectionHeight())
            
            case DetailTableDefinition.CoworkingSpaceIntroductionText.returnValue():
                return CGFloat(DetailTableDefinition.CoworkingSpaceIntroductionText.sectionHeight())
            
            case DetailTableDefinition.EverybodyPhotographHeaderOnly.returnValue():
                return CGFloat(DetailTableDefinition.EverybodyPhotographHeaderOnly.sectionHeight())
            
            case DetailTableDefinition.DetailButtonCell.returnValue():
                return CGFloat(DetailTableDefinition.DetailButtonCell.sectionHeight())
            
            case DetailTableDefinition.FacebookInformation.returnValue():
                return CGFloat(DetailTableDefinition.FacebookInformation.sectionHeight())
            
            case DetailTableDefinition.EventAndStudyInformation.returnValue():
                return CGFloat(DetailTableDefinition.EventAndStudyInformation.sectionHeight())
            
            case DetailTableDefinition.SocialButtonHeaderOnly.returnValue():
                return CGFloat(DetailTableDefinition.SocialButtonHeaderOnly.sectionHeight())
            
            default:
                return CGFloat(0.0)
        }
    }
    
    func onClickHelpButton(sender: UIBarButtonItem) {
        
        //@todo: Helpの疑似ポップアップを表示をする
        
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
