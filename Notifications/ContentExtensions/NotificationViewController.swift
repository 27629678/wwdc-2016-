//
//  NotificationViewController.swift
//  ContentExtensions
//
//  Created by hzyuxiaohua on 16/7/4.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.title
        self.subtitle?.text = notification.request.content.subtitle
        self.body?.text = notification.request.content.body
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: (UNNotificationContentExtensionResponseOption) -> Void) {
        if response.actionIdentifier == "notForward" {
            completion(.dismiss)
        }
        else if response.actionIdentifier == "destructive" {
            completion(.doNotDismiss)
        }
        else {
            completion(.dismissAndForwardAction)
        }
    }
    
}
