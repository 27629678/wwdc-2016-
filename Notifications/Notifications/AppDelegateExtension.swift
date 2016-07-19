//
//  AppDelegateExtension.swift
//  Notifications
//
//  Created by hzyuxiaohua on 7/19/16.
//  Copyright © 2016 X Co., Ltd. All rights reserved.
//

import Foundation
import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate {
    internal func registerNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (success, error) in
            assert(error == nil)
        }
        
        center.delegate = self
        center.setNotificationCategories(Set(categoriesForNotifications()))
    }
    
    func categoriesForNotifications() -> [UNNotificationCategory] {
        let unlockAction = UNNotificationAction(identifier: "unlock",
                                                title: "unlock",
                                                options: .authenticationRequired)
        let destructiveAction = UNNotificationAction(identifier: "destructive",
                                                     title: "destructive",
                                                     options: .destructive)
        
        let foregroundAction = UNNotificationAction(identifier: "foreground",
                                                    title: "foreground",
                                                    options: .foreground)
        let notForwardAction = UNNotificationAction(identifier: "notForward",
                                                    title: "not forward",
                                                    options: .foreground)
        let actions = [unlockAction, destructiveAction, foregroundAction, notForwardAction]
        let category = UNNotificationCategory(identifier: "default",
                                              actions: actions,
                                              minimalActions: [],
                                              intentIdentifiers: [],
                                              options: UNNotificationCategoryOptions(rawValue: UInt(0)))
        
        return [category]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        completionHandler()
    }
}
