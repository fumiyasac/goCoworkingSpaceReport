//
//  AppDelegate.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/24.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //UINavigationBarに関する設定
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        //アプリケーションキーとクライアントキーの設定
        NCMB.setApplicationKey("3a54f9fbb07543f5defb1d9bac3e28fdc0c2401510910791f5a200363efeb938", clientKey: "63f759590b95bfeacb20fc5ca6fe9defc8d39e6fb4c612d760293f3b4faaebd3")
        
        //NCMB疎通試験用テストコード
        /*
        let query: NCMBQuery = NCMBQuery(className: "TestClass")
        query.whereKey("message", equalTo: "Hello, NCMB!")
        query.findObjectsInBackgroundWithBlock({(NSArray objects, NSError error) in
            
            if error == nil {
                
                if objects.count > 0 {
                    let msg: AnyObject? = objects[0].objectForKey("message")
                    let msgStr: String = msg as! String
                    print("success find data. \(msgStr)")
                } else {
                    var saveError : NSError? = nil
                    let obj : NCMBObject = NCMBObject(className: "TestClass")
                    obj.setObject("Hello, NCMB!", forKey: "message")
                    obj.save(&saveError)
                    
                    if saveError == nil {
                        print("success save data.")
                    } else {
                        print("failure save data. \(saveError)")
                    }
                }
                
            } else {
                print(error.localizedDescription)
            }
        })
        */
        
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

}

