//
//  NowOpenDetailController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class NowOpenDetailController: UIViewController, UINavigationControllerDelegate {

    //ナビゲーションのアイテム
    var relatedButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        //Buttonを設置
        self.relatedButton = UIBarButtonItem(title: "関連情報", style: .Plain, target: self, action: "onClickRelatedButton:")
        self.navigationItem.title = ""
        self.navigationItem.rightBarButtonItem = self.relatedButton
    }
    
    func onClickRelatedButton(sender: UIBarButtonItem) {
        print("Related Contents.")
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
