//
//  DetailController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/10/04.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class DetailController: WKInterfaceController {

    @IBOutlet var sendMessageLabel: WKInterfaceLabel!
    
    @IBOutlet var checkButton: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func sendMessages() {
        
        // Send message
        if (WCSession.defaultSession().reachable) {
            let message = ["command" : "checkin"]
            WCSession.defaultSession().sendMessage(message,
                replyHandler: { (reply) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        self.sendMessageLabel.setText("ステータス変更！")
                    })
                },
                errorHandler: { (error) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        self.sendMessageLabel.setText("エラーが発生しました！")
                    })
                }
            )
        }
    }
    
    // MARK: - WCSessionDelegate
    func sessionWatchStateDidChange(session: WCSession) {
        let text = session.reachable ? "reachable" : "unreachable"
        dispatch_async(dispatch_get_main_queue(), {
            self.sendMessageLabel.setText(text)
        })
    }
}
