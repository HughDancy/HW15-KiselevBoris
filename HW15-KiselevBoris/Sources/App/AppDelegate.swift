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
        
        let tableViewController = TableViewController()
        let firstNavigationController = UINavigationController(rootViewController: tableViewController)
        let view = TableView()
        let model = TableModel.createModel()
        view.model = model
        tableViewController.view = view
        tableViewController.title = "Настройки"
        tableViewController.navigationItem.hidesSearchBarWhenScrolling = true

        window?.rootViewController = firstNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}

