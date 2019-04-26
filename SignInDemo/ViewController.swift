//
//  ViewController.swift
//  SignInDemo
//
//  Created by Алексей Пархоменко on 25/04/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        setupSignInButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(signOutButtonTapped))
    }
    
    fileprivate func setupSignInButton() {
        let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        signInButton.style = .iconOnly
        signInButton.center = view.center
        view.addSubview(signInButton)
    }
    
    @objc func signOutButtonTapped() {
        GIDSignIn.sharedInstance()?.signOut()
        print("123")
    }
}

