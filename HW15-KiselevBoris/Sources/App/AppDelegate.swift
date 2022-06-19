//
//  AppDelegate.swift
//  HW15-KiselevBoris
//
//  Created by Борис Киселев on 19.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstViewController = TableViewController()
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        firstViewController.title = "Настройки"
        firstViewController.navigationItem.hidesSearchBarWhenScrolling = true
                
        window?.rootViewController = firstNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}

