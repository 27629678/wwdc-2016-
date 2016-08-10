//
//  AppDelegateForNotifications.swift
//  Notifications
//
//  Created by hzyuxiaohua on 16/8/2.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

//extension AppDelegate: UNUserNotificationCenterDelegate {
//    internal func registerNotification() {
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound]) { (success, error) in
//            assert(error == nil)
//        }
//        
//        center.delegate = self
//        center.setNotificationCategories(Set(categoriesForNotifications()))
//    }
//    
//    func categoriesForNotifications() -> [UNNotificationCategory] {
//        let unlockAction = UNNotificationAction(identifier: "unlock",
//                                                title: "unlock",
//                                                options: .authenticationRequired)
//        let destructiveAction = UNNotificationAction(identifier: "destructive",
//                                                     title: "destructive",
//                                                     options: .destructive)
//        
//        let foregroundAction = UNNotificationAction(identifier: "foreground",
//                                                    title: "foreground",
//                                                    options: .foreground)
//        let notForwardAction = UNNotificationAction(identifier: "notForward",
//                                                    title: "not forward",
//                                                    options: .foreground)
//        let actions = [unlockAction, destructiveAction, foregroundAction, notForwardAction]
//        let category = UNNotificationCategory(identifier: "default",
//                                              actions: actions,
//                                              intentIdentifiers: [],
//                                              options: UNNotificationCategoryOptions(rawValue: UInt(0)))
//        
//        return [category]
//    }
//    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
//        completionHandler(.alert)
//    }
//    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
//        completionHandler()
//    }
//
//}

extension AppDelegate {
    func registerNotifications() {
        if #available(iOS 10.0, *) {
//            NEUserNotificationManager.manager().registerUserNotificationForIOSX()
        }
        else if #available(iOS 8.0, *) {
//            NEUserNotificationManager.manager().registerUserNotificationForIOS8()
        }
        else {
//            NEUserNotificationManager.manager().registerUserNotificationForIOS7()
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
    }
    
}

@available(iOS 10.0, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func regisetUserNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            assert(error == nil)
        }
        
        center.delegate = self
        center.setNotificationCategories(Set(notificationCategories()))
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    func notificationCategories() -> [UNNotificationCategory] {
        
//        let todoFinishAction = UNNotificationAction(identifier: todoDoneActionIdentifier,
//                                                    title: NSLocalizedString("标为已完成", comment: ""),
//                                                    options: .authenticationRequired)
//        let todoCategory = UNNotificationCategory(identifier: todoDoneCategoryIdentifier,
//                                                  actions: [todoFinishAction],
//                                                  intentIdentifiers: [],
//                                                  options: UNNotificationCategoryOptions(rawValue: 0))
//        let markReadAction = UNNotificationAction(identifier: readActionIdentifier,
//                                                  title: NSLocalizedString("标为已读", comment: ""),
//                                                  options: .authenticationRequired)
//        let markDeleteAction = UNNotificationAction(identifier: deleteActionIdentifier,
//                                                    title: NSLocalizedString("删除", comment: ""),
//                                                    options: [.authenticationRequired, .destructive])
//        let mardReadAndDeleteCategory = UNNotificationCategory(identifier: readAndDeletePushIdentifier,
//                                                               actions: [markReadAction, markDeleteAction],
//                                                               intentIdentifiers: [],
//                                                               options: UNNotificationCategoryOptions(rawValue: 0))
//        
//        return [todoCategory, mardReadAndDeleteCategory]
        return []
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler:
        (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: () -> Void) {
        completionHandler()
    }
    
}

@available(iOS 8.0, *)
extension AppDelegate {
    
    func registerUserNotificationForIOS8() {
        let categories = [toDoFinishCategory(), markReadAndDeleteCategory()]
        let settings = UIUserNotificationSettings(types: [.alert, .sound, .badge],
                                                  categories: Set(categories))
        UIApplication.shared.registerUserNotificationSettings(settings)
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    
    func toDoFinishAction() -> UIMutableUserNotificationAction {
        let action = UIMutableUserNotificationAction()
        action.activationMode = .background
        action.identifier = todoDoneActionIdentifier
        action.title = NSLocalizedString("标为已完成", comment: "")
        
        return action
    }
    
    func markReadAction() -> UIMutableUserNotificationAction {
        let action = UIMutableUserNotificationAction()
        action.activationMode = .background
        action.identifier = readActionIdentifier
        action.title = NSLocalizedString("标为已读", comment: "")
        
        return action
    }
    
    func markDeleteAction() -> UIMutableUserNotificationAction {
        let action = UIMutableUserNotificationAction()
        action.activationMode = .background
        action.identifier = deleteActionIdentifier
        action.title = NSLocalizedString("删除", comment: "")
        action.isDestructive = true
        
        return action
    }
    
    func toDoFinishCategory() -> UIMutableUserNotificationCategory {
        let category = UIMutableUserNotificationCategory()
        category.identifier = todoDoneCategoryIdentifier
        category .setActions([toDoFinishAction()], for: .minimal)
        
        return category
    }
    
    func markReadAndDeleteCategory() -> UIMutableUserNotificationCategory {
        let category = UIMutableUserNotificationCategory()
        category.identifier = readAndDeletePushIdentifier
        
        let actions = [markReadAction(), markDeleteAction()]
        category.setActions(actions, for: .minimal)
        category.setActions(actions, for: .default)
        
        return category
    }
    
}

@available(iOS 7.0, *)
extension AppDelegate {
    func registerUserNotificationForIOS7() {
        UIApplication.shared.registerForRemoteNotifications(matching: [.alert, .sound, .badge])
    }
}
