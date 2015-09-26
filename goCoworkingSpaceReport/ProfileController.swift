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

class ProfileController: UIViewController {

    //プロフィールのラベル
    @IBOutlet var profileTitleLabel: UILabel!
    
    //プロフィール詳細のテーブルビュー
    @IBOutlet var profileTebleView: UITableView!
    
    //バナー用のコンテナ
    @IBOutlet var bannerContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
