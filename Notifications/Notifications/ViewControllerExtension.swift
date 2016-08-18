//
//  ViewControllerExtension.swift
//  Notifications
//
//  Created by hzyuxiaohua on 16/7/20.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import Foundation
import UserNotifications

extension ViewController {
    
    func sendNotification(_ toExtension: Bool) {
        let content = defaultContent(attachmentEnabled.isOn, sendTo: toExtension)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let req : UNNotificationRequest = UNNotificationRequest(identifier: "1",
                                                                content: content,
                                                                trigger: trigger)
        UNUserNotificationCenter.current().add(req) { (error) in
            assert(error == nil)
        }
    }
    
    func updateNotification(_ identifier: String) {
        let content = defaultContent(attachmentEnabled.isOn, sendTo: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let req : UNNotificationRequest = UNNotificationRequest(identifier: "1",
                                                                content: content,
                                                                trigger: trigger)
        UNUserNotificationCenter.current().add(req) { (error) in
            assert(error == nil)
        }
    }
    
    func revokeNotification(_ identifier: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["1"])
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["1"])
    }
    
    private func defaultContent(_ showAttachment: Bool, sendTo toExtension: Bool) -> UNNotificationContent {
        let date = Date(timeIntervalSinceNow: 0)
        let content = UNMutableNotificationContent();
        content.title = toExtension == false ? "Hello, world!" : "Hello, world![modified]"
        content.subtitle = date.description
        content.body = "Body:亲，产品过锁定期后就转到灵活账户了，就不再收取退保费啦~~"
        content.sound = UNNotificationSound.default()
        
        if toExtension {
            content.categoryIdentifier = "default"
        }
        
        if showAttachment {
            content.attachments = [defaultAttachment()!]
        }
        
        return content
    }
    
    private func defaultAttachment() -> UNNotificationAttachment? {
        let path = Bundle.main.path(forResource: "avatar", ofType: "jpg")
        let url = URL(fileURLWithPath: path!)
        
        return try? UNNotificationAttachment(identifier: "attach", url: url, options: nil)
    }
}
