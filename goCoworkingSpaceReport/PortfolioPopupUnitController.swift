//
//  PortfolioPopupUnitController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/12/01.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

class PortfolioPopupUnitController: UIViewController, UITextViewDelegate {
        
    //配置したインスタンス群
    @IBOutlet var portfolioBackground: UIView!
    @IBOutlet var portfolioCloseBtn: UIButton!
    @IBOutlet var portfolioTitleLbl: UILabel!
    @IBOutlet var portfolioImageView: UIImageView!
    @IBOutlet var portfolioShotDescLbl: UILabel!
    @IBOutlet var portfolioCategoryLbl: UILabel!
    @IBOutlet var portfolioLongDescTxt: UITextView!
    @IBOutlet var portfolioLinkBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        
        //再配置用の計算値
        let portfolioLongDescTxtWidth: Int = DeviceSize.screenWidth() - 20
        let portfolioLongDescTxtHeight: Int = DeviceSize.screenHeight() - 400

        self.portfolioLongDescTxt.frame = CGRectMake(
            CGFloat(10),
            CGFloat(330),
            CGFloat(portfolioLongDescTxtWidth),
            CGFloat(portfolioLongDescTxtHeight)
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //----- サンプル用テストデータ #Start ------
        self.portfolioLongDescTxt.editable = false
        self.portfolioLongDescTxt.dataDetectorTypes = .Link
        
        //設定値など
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineHeightMultiple = 1.5
        
        do {
            
            let htmlText: String =
                "テキストカラーは<font color=\"blue\">青色</font>です。<br>" +
                "テキストカラーは<font color=\"red\">赤色</font>です。<br>" +
                "ヤフージャパンへのリンクは<a href=\"http://www.yahoo.co.jp/\"><strong>こちら</strong></a><br>" +
                "CSSスタイルは<strong style=\"color:#663399;\">こんな風に</strong>適用されます。"
            
            let encodedData = htmlText.dataUsingEncoding(NSUTF8StringEncoding)!
            let attributedOptions : [String : AnyObject] = [
                NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding,
                NSParagraphStyleAttributeName : paragraph
            ]
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            
            self.portfolioLongDescTxt.attributedText = attributedString
            
        } catch {
            fatalError("Unhandled error: \(error)")
        }
        //----- サンプル用テストデータ #End ------
        
        //@todo:データの処理
        
    }
    
    @IBAction func closeBtnAction(sender: UIButton) {
        
        //押されたらポップアップ状態から消す
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
