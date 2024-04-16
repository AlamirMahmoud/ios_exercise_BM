//
//  AppDelegate.swift
//  ios_exercise
//
//  Created by admin on 16/04/2024.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let view = UIViewController()
        view.view.backgroundColor = UIColor.red
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        return true
    }

}

