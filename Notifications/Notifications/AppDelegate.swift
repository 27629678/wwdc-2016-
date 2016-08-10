//
//  AppDelegate.swift
//  Notifications
//
//  Created by hzyuxiaohua on 16/7/4.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        registerNotification()
        
        let courier = Courier(groupIdentifier: "group.x")
        if courier.sendmessage("hello, world!", command: "init") {
            // do nothing
        }
        else {
            print("courier send message failed!")
        }
        
        return true
    }
}

