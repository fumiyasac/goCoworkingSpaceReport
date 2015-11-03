//
//  ProfileEditController.swift
//  goCoworkingSpaceReport
//
//  Created by 酒井文也 on 2015/09/27.
//  Copyright © 2015年 just1factory. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ProfileEditController: UIViewController, UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    override func viewWillAppear(animated: Bool) {
        
        //注意：このタイミングでログイン判定をしないとアプリが落ちる...
        //テストのログイン処理
        if PFUser.currentUser() == nil {
            self.login()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //NavigationControllerのデリゲート
        self.navigationController?.delegate = self
        
        //ナビゲーション関連設定
        self.navigationController?.navigationBar.barTintColor = ColorDefinition.colorWithHexString(ColorStatus.Yellow.rawValue)
        self.navigationController?.navigationBar.tintColor = ColorDefinition.colorWithHexString(ColorStatus.White.rawValue)
        
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 15)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        
    }
    
    //ログイン処理
    func login() {
        
        //※UIをカスタマイズするのは面倒臭いときはこれを活用するのも一つの手かも...
        //LogInViewControllerをカスタマイズする（ParseUI.frameworkで提供されているもの）
        let login = PFLogInViewController()
        login.delegate = self
        login.fields = ([PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton, PFLogInFields.SignUpButton, PFLogInFields.PasswordForgotten, PFLogInFields.DismissButton])
        
        //SignUpViewControllerをカスタマイズする（ParseUI.frameworkで提供されているもの）
        let signup = PFSignUpViewController()
        signup.fields = ([PFSignUpFields.UsernameAndPassword, PFSignUpFields.SignUpButton, PFSignUpFields.Email, PFSignUpFields.DismissButton])
        signup.delegate = self
        login.signUpController = signup
        
        self.presentViewController(login, animated: true, completion: nil)
    }
    
    //ログアウト処理
    func logout() {
        
    }
    
    //PFLogInViewControllerDelegateのメソッド
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        // ユーザ名とパスワードのチェックのメソッド
        if (!username.isEmpty || !password.isEmpty) {
            return true
        } else {
            let alertController = UIAlertController(title: "ログインできません", message: "ユーザー名またはパスワードに誤りがあります。", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            //エラー時にはポップアップを表示する
            logInController.presentViewController(alertController, animated: true, completion: nil)
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("Failed to log in...")
    }
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        print("User dismissed the logInViewController")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //PFSignUpViewControllerDelegateのメソッド
    func signUpViewController(signUpController: PFSignUpViewController,
        shouldBeginSignUp info: [NSObject : AnyObject]) -> Bool {
            
            //パスワードは8文字以上でお願いします
            if let password = info["password"] as? String {
                return password.utf16.count >= 8
            } else {
                return false
            }
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Failed to sign up...")
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

