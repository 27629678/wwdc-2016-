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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let query = url.query?.lowercased() else {
            return false
        }
        
        var message: String? = nil
        var alert_type: UIAlertControllerStyle = .alert
        
        if query.contains("alert") {
            message = "alert"
        }
        else if query.contains("actionsheet") {
            message = "actionSheet"
            alert_type = .actionSheet
        }
        else if query.contains("notification") {
            message = "notification"
        }
        
        let alert = UIAlertController(title: "Event", message: message ?? "no event", preferredStyle: alert_type)
        let cancel_action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancel_action)
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
        return true
    }

}

