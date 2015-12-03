//
//  HelpController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/04.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class HelpController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        let backButton: UIBarButtonItem = UIBarButtonItem()
        
        // 戻るボタンの文字を空文字にする
        backButton.title = ""
        viewController.navigationItem.backBarButtonItem = backButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
