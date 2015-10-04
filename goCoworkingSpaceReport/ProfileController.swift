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

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //プロフィールのラベル
    @IBOutlet var profileTitleLabel: UILabel!
    
    //プロフィール詳細のテーブルビュー
    @IBOutlet var profileTebleView: UITableView!
    
    //バナー用のコンテナ
    @IBOutlet var bannerContainer: UIView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 2
    
    //テーブルビューのセル数
    let cellCountOne: Int = 4
    let cellCountTwo: Int = 1

    //テーブルビューのセル高
    let cellHeightOne: CGFloat = 65.0
    let cellHeightTwo: CGFloat = 40.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //デリゲート
        self.profileTebleView.delegate = self
        self.profileTebleView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let notTapNib:UINib = UINib(nibName: "ProfileNotTapCell", bundle: nil)
        self.profileTebleView.registerNib(notTapNib, forCellReuseIdentifier: "ProfileNotTapCell")
        let tapNib:UINib = UINib(nibName: "ProfileTapCell", bundle: nil)
        self.profileTebleView.registerNib(tapNib, forCellReuseIdentifier: "ProfileTapCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        //セクションのセル高
        if (indexPath.section == 0) {
        
            //Xibファイルを元にデータを作成する
            let cellOne = tableView.dequeueReusableCellWithIdentifier("ProfileNotTapCell") as? ProfileNotTapCell;
        
            //テキスト・画像等の表示
            cellOne!.profileCategoryLabel.text = "タイトル"
            cellOne!.profileCategoryText.text = "テキスト"
        
            //セルのアクセサリタイプ
            cellOne!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        
            //セルタップ時の背景を変えない
            cellOne!.selectionStyle = UITableViewCellSelectionStyle.None;
        
            cell = cellOne!
        
        } else if (indexPath.section == 1) {
            
            //Xibファイルを元にデータを作成する
            let cellTwo = tableView.dequeueReusableCellWithIdentifier("ProfileTapCell") as? ProfileTapCell;
            
            //テキスト・画像等の表示
            cellTwo!.editProfileLabel.text = "> 編集する"
            
            //セルのアクセサリタイプ
            cellTwo!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
            
            //セルタップ時の背景を変えない
            cellTwo!.selectionStyle = UITableViewCellSelectionStyle.None;
            
            cell = cellTwo!
        }
        return cell;
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 1) {
            print("Left TableView Tapped！")
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
