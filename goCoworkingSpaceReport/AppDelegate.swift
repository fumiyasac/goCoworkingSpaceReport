//
//  AppDelegate.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/24.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit
import WatchConnectivity

//Parseフレームワークのインポート
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
         UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        
        //ここをみなさんのアカウントのやつにしてください
        // Initialize Parse.
        Parse.setApplicationId("KQAv779gLsy2bLsHW4aZQ0TEqffj69FAvbWziLQk", clientKey: "2tqkviVdZ9q0bUYNKQKhxnjMP02xwUVi1OnaMtBV")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        // WatchConnectivity Check
        if (WCSession.isSupported()) {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
            if session.paired != true {
                print("Apple Watch is not paired")
            }
            
            if session.watchAppInstalled != true {
                print("WatchKit app is not installed")
            }
            
        } else {
            print("WatchConnectivity is not supported on this device")
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //Interactive Messagingの処理
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        //コールバック用のDictionaryデータ
        var replyValues = Dictionary<String, AnyObject>()
        
        //最初の画面のViewControllerのインスタンス
        let viewController = self.window!.rootViewController as! ViewController
        
        //Watch側から送られてきた値（AnyObjectなのでStringにダウンキャスト）
        let operation: String = message["command"] as! String
        
        if (operation == "checkin") {
            
            viewController.debugLabel.text = "チェックイン時間を記録しました！"
            
            //@todo:新規登録処理
            
            replyValues["status"] = "OK"
            
        } else if (operation == "checkout") {
            
            viewController.debugLabel.text = "チェックアウト時間を記録しました！"
            
            //@todo:既存更新処理
            
            replyValues["status"] = "OK"
            
        }
        replyHandler(replyValues)
    }
}

