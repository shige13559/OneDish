//
//  LoginViewController.swift
//  OneDish
//
//  Created by 原田茂大 on 2019/12/16.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    
    
    
    @IBAction func emailClickButton(_ sender: UIButton) {
        
        
    }
    
}

extension LoginViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            //errorがnilでない場合(エラーが存在する場合)
            //エラー情報を出力
            print(error.localizedDescription)
            //処理を中断
            return
        }
               
        guard let authentication = user.authentication else {
            //認証情報が取れなければ、処理を中断
            return
        }
               
        //Firebaseに認証情報を登録
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
        accessToken: authentication.accessToken)
               
        Auth.auth().signIn(with: credential) { (result, error) in
                   
            if let error = error{
                //エラーがある場合
                print(error.localizedDescription)
            }else{
                //ログインが成功した場合
                print("ログイン成功")
//                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
                   
        }
    }
    
    
}
