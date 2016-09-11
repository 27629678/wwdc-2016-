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


    fileprivate func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ClassTestRunner().run()
        ClosureTestRunner().run()
        var count = 60
        if #available(iOS 10.0, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                print("counting:\(count)")
                count -= 1
                
                if count <= 0 {
                    timer.invalidate()
                }
            }
            
            timer.fire()
        } else {
            // Fallback on earlier versions
        }
        
        return true
    }

}

