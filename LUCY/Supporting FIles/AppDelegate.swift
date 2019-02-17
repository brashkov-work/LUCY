//
//  AppDelegate.swift
//  LUCY
//
//  Created by Boris Rashkov on 15.02.19.
//  Copyright © 2019 Boris Rashkov. All rights reserved.
//

import UIKit
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = self
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.backgroundColor = UIColor.white
        
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                // pushing to create pill view controller
            }
        }
        
        let v1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "More") as UIViewController
        let v2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Profile") as UIViewController
        let v3 = UIViewController() // dummy VC
        let v4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JournalSection") as UIViewController
        let v5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JournalSection") as UIViewController
        
        v1.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Journal", image: UIImage(named: "Journal-calendar-inactive"), selectedImage: UIImage(named: "Journal-calendar"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Reports", image: UIImage(named: "Reports-inactive"), selectedImage: UIImage(named: "Reports"))
        v3.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: nil, image: UIImage(named: "Plus"), selectedImage: UIImage(named: "Plus"))
        v4.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Documents", image: UIImage(named: "Documents"), selectedImage: UIImage(named: "Documents-inactive"))
        v5.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "More", image: UIImage(named: "More"), selectedImage: UIImage(named: "More-inactive"))

        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        
        let navigationController = CustomLucyNavigationController.init(rootViewController: tabBarController)
        
        tabBarController.title = "LUCY"
        
        
        self.window?.rootViewController = navigationController
        
        return true
    }
}

