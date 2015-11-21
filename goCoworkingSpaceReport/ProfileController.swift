//
//  ProfileController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

//CALayerクラスのインポート
import QuartzCore

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //プロフィールのラベル
    @IBOutlet var profileTitleLabel: UILabel!
    
    //プロフィール詳細のテーブルビュー
    @IBOutlet weak var profileTableView: UITableView!
    
    //バナー用のコンテナ
    @IBOutlet var bannerContainer: UIView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 2
    
    //テーブルビューのセル数
    let cellCountOne: Int = 6
    let cellCountTwo: Int = 3

    //テーブルビューのセル高
    let cellHeightOne: CGFloat = 55.0
    let cellHeightTwo: CGFloat = 40.0
    
    //テーブルビューの下の離す高さと
    let underHeight: Int! = 60
    let upperHeight: Int! = 65
    let titleLabelHeight: Int! = 28
    
    //現在認証中のユーザー名
    var currentUser: String?
    
    override func viewWillAppear(animated: Bool) {
        
        //認証中か否かの判定
        if PFUser.currentUser() == nil {
            self.currentUser = "UNKNOWN"
        } else {
            //@todo: 自分の情報をParse.comより取得
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileTableView.frame = CGRectMake(
            CGFloat(0),
            CGFloat(28),
            CGFloat(240),
            CGFloat(DeviceSize.screenHeight() - (self.underHeight + self.upperHeight + self.titleLabelHeight))
        )
        
        //デリゲート
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let notTapNib:UINib = UINib(nibName: "ProfileNotTapCell", bundle: nil)
        self.profileTableView.registerNib(notTapNib, forCellReuseIdentifier: "ProfileNotTapCell")
        let tapNib:UINib = UINib(nibName: "ProfileTapCell", bundle: nil)
        self.profileTableView.registerNib(tapNib, forCellReuseIdentifier: "ProfileTapCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if (section == 0) {
            
            let profileImage: UIImageView! = UIImageView(
                frame: CGRect(x:75, y:15, width: 90, height: 90)
            )
            profileImage.layer.cornerRadius = CGFloat(45)
            
            let otherLabel: UILabel! = UILabel(
                frame: CGRect(x:0, y:115, width: tableView.bounds.width, height: 20)
            )
            otherLabel.textAlignment = NSTextAlignment.Center
            otherLabel.font = UIFont.boldSystemFontOfSize(19)
            
            let profileImageArea: UIView! = UIView(
                frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 150)
            )
            profileImageArea.addSubview(profileImage)
            profileImageArea.addSubview(otherLabel)
            
            profileImageArea.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Gray.rawValue)
            profileImage.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
            otherLabel.textColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
            otherLabel.text = self.currentUser
            
            return profileImageArea
            
        } else {
            
            let otherLabel: UILabel! = UILabel(
                frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 28)
            )
            otherLabel.textAlignment = NSTextAlignment.Center
            otherLabel.font = UIFont.boldSystemFontOfSize(15)
            otherLabel.backgroundColor = ColorDefinition.colorWithHexString(ColorStatus.Brown.rawValue)
            otherLabel.textColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
            otherLabel.text = "その他の設定"
            return otherLabel
        }
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (section == 0) {
            return CGFloat(150.0)
        } else {
            return CGFloat(28.0)
        }
    }
    
    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return sectionCount
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セクションのセル数
        if (section == 0) {
            return cellCountOne
        } else if (section == 1) {
            return cellCountTwo
        } else {
            return 0
        }
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        let profileBtnArray: Array! = ["> プロフィールを編集する","> このアプリの説明","> アプリからのお知らせ"]
        
        //セクションのセル高
        if (indexPath.section == 0) {
        
            //Xibファイルを元にデータを作成する
            let cellOne = tableView.dequeueReusableCellWithIdentifier("ProfileNotTapCell") as? ProfileNotTapCell;
        
            //テキスト・画像等の表示
            cellOne!.profileCategoryLabel.text = "タイトル"
            cellOne!.profileCategoryText.text = "テキスト"
        
            //セルのアクセサリタイプ
            cellOne!.accessoryType = UITableViewCellAccessoryType.None
        
            //セルタップ時の背景を変えない
            cellOne!.selectionStyle = UITableViewCellSelectionStyle.None
            cell = cellOne!
        
        } else if (indexPath.section == 1) {
            
            //Xibファイルを元にデータを作成する
            let cellTwo = tableView.dequeueReusableCellWithIdentifier("ProfileTapCell") as? ProfileTapCell;
            
            //テキスト・画像等の表示
            cellTwo!.editProfileLabel.text = profileBtnArray[indexPath.row]
            
            //セルのアクセサリタイプ
            cellTwo!.accessoryType = UITableViewCellAccessoryType.None;
            
            //セルタップ時の背景を変えない
            cellTwo!.selectionStyle = UITableViewCellSelectionStyle.None;
            cell = cellTwo!
        }
        return cell;
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 1) {
            
            if (indexPath.row == 0) {
                
                //遷移するViewを定義して遷移する(Containerでembedされているのでこの記法になる)
                let profileEdit:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileEdit") as! ProfileEditController
                profileEdit.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
                self.presentViewController(profileEdit, animated: true, completion: nil)
            }
        }
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        //セクションのセル高
        if (indexPath.section == 0) {
            return cellHeightOne
        } else if (indexPath.section == 1) {
            return cellHeightTwo
        } else {
            return 0
        }
    }

}
