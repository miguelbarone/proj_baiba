//
//  AppDelegate.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let appDI = AppDIContainer()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
    
        let firstRootView = appDI.showChooseSideViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: firstRootView)
        navigation.isNavigationBarHidden = true
        self.window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let vc = appDI.makeHomeViewController()
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
//
        return true
    }
}
