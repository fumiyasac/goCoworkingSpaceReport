//
//  ProfileEditController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class ProfileEditController: UIViewController, UINavigationControllerDelegate {
    
    //ログインボタン
    @IBOutlet var loginBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //NavigationControllerのデリゲート
        self.navigationController?.delegate = self
        
        //ナビゲーション関連設定
        self.navigationController?.navigationBar.barTintColor = ColorDefinition.colorWithHexString(ColorStatus.Yellow.rawValue)
        self.navigationController?.navigationBar.tintColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
        
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 15)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        
    }
    
    //ログインボタン押下時のアクション
    @IBAction func loginBtnAction(sender: UIButton) {
        print("Profile edit or signup to contents...")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

