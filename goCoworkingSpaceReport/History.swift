//
//  History.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/10/09.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

//Parseクラスのインポート
import Parse

class History: NSObject {

    var mailAddress: String
    var coworkingSpaceId: Int
    var status: Int
    var historyDate: NSDate
    
    init(historyDate: NSDate) {
        self.mailAddress = "info@example.com"
        self.coworkingSpaceId = 1
        self.status = 0
        self.historyDate = historyDate
    }
    
    func saveHistory() {
        let testObject = PFObject(className: "History")
        testObject["mailAddress"]      = self.mailAddress
        testObject["coworkingSpaceId"] = self.coworkingSpaceId
        testObject["status"]           = self.status
        testObject["historyDate"]      = self.historyDate
        
        testObject.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                print("History has been saved")
            }
        }
    }
    
}
