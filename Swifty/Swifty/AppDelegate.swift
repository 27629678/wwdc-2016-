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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        ClassTestRunner().run()
        ClosureTestRunner().run()
        ErrorHandlingTestRunner().run()
        
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

