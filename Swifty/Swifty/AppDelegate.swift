//
//  AppDelegate.swift
//  Swifty
//
//  Created by hzyuxiaohua on 7/13/16.
//  Copyright © 2016 XY. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        ClassTestRunner().run()
        
        return true
    }

}

