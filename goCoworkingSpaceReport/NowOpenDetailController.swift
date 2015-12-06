//
//  NowOpenDetailController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class NowOpenDetailController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    //テーブルビューの要素数
    let sectionCount: Int = 6
    
    //テーブルビュー
    @IBOutlet var detailTableView: UITableView!
    
    //ユーザーの写真サムネイル用のコンテナ
    @IBOutlet var userThumbContainer: UIView!

    //ポートフォリオ用のコンテナ
    @IBOutlet var portfolioThumbContainer: UIView!
    
    //ナビゲーションのアイテム
    var helpButton: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        
        //初期位置
        self.detailTableView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(65),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DeviceSize.screenHeight() - 109)
        )
        
        self.userThumbContainer.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DetailTableDefinition.EveryoneGalleryHeaderOnly.sectionHeaderHeight())
        )
        
        self.portfolioThumbContainer.frame = CGRectMake(
            CGFloat(0),
            CGFloat(0),
            CGFloat(DeviceSize.screenWidth()),
            CGFloat(DetailTableDefinition.SocialButtonHeaderOnly.sectionHeaderHeight())
        )
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //NavigationControllerのデリゲート
        self.navigationController?.delegate = self
        
        //テーブルビュー関連設定
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.separatorColor = UIColor.clearColor()
        
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
        
        let backButton: UIBarButtonItem = UIBarButtonItem()
        
        // 戻るボタンの文字を空文字にする
        backButton.title = ""
        self.navigationItem.backBarButtonItem = backButton
        
        //各セクション用のXibの設定
        let nibMainImage:UINib = UINib(nibName: "IntroductionImageCell", bundle: nil)
        self.detailTableView.registerNib(nibMainImage, forCellReuseIdentifier: "IntroductionImage")

        let nibMainText:UINib = UINib(nibName: "IntroductionTextCell", bundle: nil)
        self.detailTableView.registerNib(nibMainText, forCellReuseIdentifier: "IntroductionText")
        
        let nibMainDetail:UINib = UINib(nibName: "IntroductionDetailCell", bundle: nil)
        self.detailTableView.registerNib(nibMainDetail, forCellReuseIdentifier: "IntroductionDetail")
        
        let nibDetailButton:UINib = UINib(nibName: "DetailButtonCell", bundle: nil)
        self.detailTableView.registerNib(nibDetailButton, forCellReuseIdentifier: "DetailButton")
        
        let nibBlank:UINib = UINib(nibName: "BlankCell", bundle: nil)
        self.detailTableView.registerNib(nibBlank, forCellReuseIdentifier: "Blank")
        
    }
    
    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return self.sectionCount
    }
    
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
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Enumで設定した行数
        switch (section) {
            
            case DetailTableDefinition.CoworkingSpaceIntroductionImage.returnValue():
                return DetailTableDefinition.CoworkingSpaceIntroductionImage.sectionAmount()
            
            case DetailTableDefinition.CoworkingSpaceIntroductionText.returnValue():
                return DetailTableDefinition.CoworkingSpaceIntroductionText.sectionAmount()
            
            case DetailTableDefinition.CoworkingSpaceIntroductionDetail.returnValue():
                return DetailTableDefinition.CoworkingSpaceIntroductionDetail.sectionAmount()
            
            case DetailTableDefinition.DetailButtonCell.returnValue():
                return DetailTableDefinition.DetailButtonCell.sectionAmount()
            
            default:
                return 0
        }
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        //読み込むXibに関する条件分岐を行う
        //Enumで設定した行数
        switch (indexPath.section) {
            
            case DetailTableDefinition.CoworkingSpaceIntroductionImage.returnValue():
                let cellOne = tableView.dequeueReusableCellWithIdentifier("IntroductionImage") as? IntroductionImageCell
                cellOne!.accessoryType = UITableViewCellAccessoryType.None
                cellOne!.selectionStyle = UITableViewCellSelectionStyle.None
                cell = cellOne!
                break
            
            case DetailTableDefinition.CoworkingSpaceIntroductionText.returnValue():
                let cellTwo = tableView.dequeueReusableCellWithIdentifier("IntroductionText") as? IntroductionTextCell
                cellTwo!.accessoryType = UITableViewCellAccessoryType.None
                cellTwo!.selectionStyle = UITableViewCellSelectionStyle.None
                cell = cellTwo!
                break
            
            case DetailTableDefinition.CoworkingSpaceIntroductionDetail.returnValue():
                let cellThree = tableView.dequeueReusableCellWithIdentifier("IntroductionDetail") as? IntroductionDetailCell
                cellThree!.accessoryType = UITableViewCellAccessoryType.None
                cellThree!.selectionStyle = UITableViewCellSelectionStyle.None
                cell = cellThree!
                break
            
            case DetailTableDefinition.DetailButtonCell.returnValue():
                let cellFour = tableView.dequeueReusableCellWithIdentifier("DetailButton") as? DetailButtonCell
                
                //テーブルビューの画像・文言の設定を行う
                let detailButtonArrayGroups: [[String]] = NowDetailTableCellDefintion.cellConstTexts()
                let detailButtonArray: Array = detailButtonArrayGroups[indexPath.row]
                
                cellFour!.viewThumbImage.image = UIImage(named: detailButtonArray[0])
                cellFour!.detailButtonTitle.text = detailButtonArray[1]
                cellFour!.detailButtonRemark.text = detailButtonArray[2]
                cellFour!.detailButtonText.text = detailButtonArray[3]
                
                if indexPath.row > 1 {
                    cellFour!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                } else {
                    cellFour!.accessoryType = UITableViewCellAccessoryType.None
                }
                
                cellFour!.selectionStyle = UITableViewCellSelectionStyle.None
                cell = cellFour!
                break
            
            default:
                let cellBlank = tableView.dequeueReusableCellWithIdentifier("Blank") as? BlankCell
                cellBlank!.accessoryType = UITableViewCellAccessoryType.None
                cellBlank!.selectionStyle = UITableViewCellSelectionStyle.None
                cell = cellBlank!
                break
            }
            return cell
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //@todo: 各コントローラーへの遷移
        switch (indexPath.section) {
            
            case DetailTableDefinition.DetailButtonCell.returnValue():
        
                if indexPath.row == 0 {
                    
                    let mapPopup:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MapPopup") as! MapPopupUnitController
                    
                    mapPopup.view.backgroundColor = UIColor.clearColor()
                    mapPopup.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
                    self.presentViewController(mapPopup, animated: false, completion: nil)
                }
            
            default:
                break
        }
        
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        //セクションセル高
        switch (indexPath.section) {
            
            case DetailTableDefinition.CoworkingSpaceIntroductionImage.returnValue():
                return CGFloat(DetailTableDefinition.CoworkingSpaceIntroductionImage.sectionHeight())
            
            case DetailTableDefinition.CoworkingSpaceIntroductionText.returnValue():
                return CGFloat(DetailTableDefinition.CoworkingSpaceIntroductionText.sectionHeight())
            
            case DetailTableDefinition.CoworkingSpaceIntroductionDetail.returnValue():
                return CGFloat(DetailTableDefinition.CoworkingSpaceIntroductionDetail.sectionHeight())
            
            case DetailTableDefinition.DetailButtonCell.returnValue():
                return CGFloat(DetailTableDefinition.DetailButtonCell.sectionHeight())
            
            default:
                return CGFloat(0.0)
        }
    }
    
    func onClickHelpButton(sender: UIBarButtonItem) {
        
        //@todo: Helpの疑似ポップアップを表示をする
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
