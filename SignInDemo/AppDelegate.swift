//
//  AppDelegate.swift
//  SignInDemo
//
//  Created by Алексей Пархоменко on 25/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "313857215427-1jcrlhinj8g9apbolhcqefgsjvg8s419.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL?,
                                                 sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }

    // MARK: GIDSignInDelegate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            guard let fullName = user.profile.name, let image = user.profile.imageURL(withDimension: 400) else { return }
            print("fullName: \(fullName), image: \(image)")
        }
    }
}

