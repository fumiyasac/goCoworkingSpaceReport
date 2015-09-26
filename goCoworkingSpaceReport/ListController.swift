//
//  ListController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/25.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

class ListController: UIViewController {

    //ラベルボタン
    @IBOutlet var nowOpenButton: UIButton!
    @IBOutlet var nowHereButton: UIButton!
    @IBOutlet var visitHistoryButton: UIButton!
    
    //プロフィール表示用コンテナ
    @IBOutlet var profileContainer: UIView!
    
    //コンテンツ表示用コンテナ
    @IBOutlet var nowOpenContainer: UIView!
    @IBOutlet var nowHereContainer: UIView!
    @IBOutlet var visitHistoryContainer: UIView!
    
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
