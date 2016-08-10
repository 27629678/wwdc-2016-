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
    func defaultContent(_ showAttachment: Bool, sendTo toExtension: Bool) -> UNNotificationContent {
        let date = Date(timeIntervalSinceNow: 0)
        let content = UNMutableNotificationContent();
        content.title = "Hello, world!"
        content.subtitle = date.description
        content.body = "Body:亲，产品过锁定期后就转到灵活账户了，就不再收取退保费啦~~"
        content.sound = UNNotificationSound.default()
        
        if toExtension {
            content.categoryIdentifier = "default"
        }
        
        return content
    }
    
    func sendNotification(_ toExtension: Bool) {
        let content = defaultContent(attachmentEnabled.isOn, sendTo: toExtension)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let req : UNNotificationRequest = UNNotificationRequest(identifier: "1",
                                                                content: content,
                                                                trigger: trigger)
        UNUserNotificationCenter.current().add(req) { (error) in
            assert(error == nil)
        }
    }
}
