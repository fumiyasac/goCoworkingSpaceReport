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
    
    //ボタン関連
    @IBOutlet var sendCheckInBtn: WKInterfaceButton!
    @IBOutlet var sendCheckoutBtn: WKInterfaceButton!
    
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
    
    @IBAction func sendCheckInMessage() {
        
        // Send message of Test Code. (This is Test Code for 10/11)
        self.sendMessageLabel.setText("Adding...")
        
        if (WCSession.defaultSession().reachable) {
            let message = ["command" : "checkin"]
            WCSession.defaultSession().sendMessage(message,
                replyHandler: { (reply) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        let messageForResult: String! = String(reply["status"]!)
                        self.sendMessageLabel.setText(messageForResult)
                    })
                },
                errorHandler: { (error) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        self.sendMessageLabel.setText("Error！")
                    })
                }
            )
        }
    }
    
    @IBAction func sendCheckOutMessage() {
        
        // Send message of Test Code (This is Test Code for 10/11)
        self.sendMessageLabel.setText("Returning...")
        
        if (WCSession.defaultSession().reachable) {
            let message = ["command" : "checkout"]
            WCSession.defaultSession().sendMessage(message,
                replyHandler: { (reply) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        let messageForResult: String! = String(reply["status"]!)
                        self.sendMessageLabel.setText(messageForResult)
                    })
                },
                errorHandler: { (error) -> Void in
                    dispatch_async(dispatch_get_main_queue(), {
                        self.sendMessageLabel.setText("Error！")
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
