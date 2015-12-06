//
//  PhotoPopupUnitController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/11/28.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class PhotoPopupUnitController: UIViewController {

    //詳細ページからもらう値
    var photoUserId: Int!
    var photoUserName: String!
    var photoUserImage: UIImage!
    var photoImage: UIImage!
    var photoComment: String!
    
    //配置したインスタンス群
    @IBOutlet var photoBackGround: UIView!
    @IBOutlet var photoClosebtn: UIButton!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoUserimageView: UIImageView!
    @IBOutlet var photoUserNameLbl: UILabel!
    @IBOutlet var photoCommentTxt: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        
        //再配置用の計算値
        let photoCommentTxtWidth: Int = DeviceSize.screenWidth() - 20
        let photoCommentTxtHeight: Int = DeviceSize.screenHeight() - 410
        
        self.photoCommentTxt.frame = CGRectMake(
            CGFloat(10),
            CGFloat(400),
            CGFloat(photoCommentTxtWidth),
            CGFloat(photoCommentTxtHeight)
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //@todo:データの処理
        
    }

    @IBAction func photoCloseAction(sender: UIButton) {
        
        //押されたらポップアップ状態から消す
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
