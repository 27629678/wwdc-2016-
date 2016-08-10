//
//  NotificationService.swift
//  ServiceExtension
//
//  Created by hzyuxiaohua on 16/7/20.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest,
                             withContentHandler contentHandler:(UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
            
            let urlString = request.content.userInfo["url-attachment"] as! String
            if let url = URL(string: urlString) {
                let attachment: UNNotificationAttachment?
                do {
                    attachment = try UNNotificationAttachment(identifier: "", url: url, options: nil)
                }
                catch {
                    assert(false)
                    attachment = nil
                }
                
                if let attachment = attachment {
                    bestAttemptContent.attachments = [attachment]
                }
            }
            
            if let uid = request.content.userInfo["uid"] as? String {
                recordNotificationUid(uid)
            }
            
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

    func recordNotificationUid(_ uid: String!) {
        // do nothing
    }
}
