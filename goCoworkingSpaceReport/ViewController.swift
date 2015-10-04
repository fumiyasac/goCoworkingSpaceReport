//
//  ViewController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/24.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Debug.
    @IBOutlet var debugLabel: UILabel!
    
    //オープニング画像スクロールビュー
    @IBOutlet var openingScrollView: UIScrollView!
    
    //ページコントロール
    @IBOutlet var pageControl: UIPageControl!
    
    //はじめるボタン
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Parseテスト用のコード（Object has been saved.がコンソールに表示されれば通信が成功）
        /*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        */
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
