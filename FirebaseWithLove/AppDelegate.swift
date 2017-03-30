//
//  AppDelegate.swift
//  FirebaseWithLove
//
//  Created by Juan Antonio Martin Noguera on 28/03/2017.
//  Copyright © 2017 COM. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
    }
}

extension AppDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let _ = error {
            
            print("Error")
            return
        }
        
        guard let authForFireBase = user.authentication else {
            return
        }
        
        let creditials = FIRGoogleAuthProvider.credential(withIDToken: authForFireBase.idToken, accessToken: authForFireBase.accessToken)
        
        FIRAuth.auth()?.signIn(with: creditials, completion: { (user, error) in
            if let _ = error {
                print("Error")
                return
            }
            print(user?.displayName)
            
            
        })
        
        
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print(user.userID)
    }
    
    
    
}

















