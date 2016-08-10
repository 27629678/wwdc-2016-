//
//  ViewController.swift
//  Notifications
//
//  Created by hzyuxiaohua on 16/7/4.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var attachmentEnabled: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendBtnAction(_ sender: AnyObject) {
        sendNotification(false)
    }
    
    @IBAction func sendToContentExtensionAction(_ sender: AnyObject) {
        sendNotification(true)
    }
}

extension ViewController {
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
    
    func defaultContent(_ showAttachment: Bool, sendTo toExtension: Bool) -> UNNotificationContent {
        let date = Date(timeIntervalSinceNow: 0)
        let content = UNMutableNotificationContent();
        content.title = "Hello, world!"
        content.subtitle = date.description
        content.body = "Body:亲，产品过锁定期后就转到灵活账户了，就不再收取退保费啦~~"
        content.sound = UNNotificationSound.default()
        
        if showAttachment {
            content.attachments = defaultAttachment()
        }
        
        if toExtension {
            content.categoryIdentifier = "default"
        }
        
        return content
    }
    
    func defaultAttachment() -> [UNNotificationAttachment] {
        var attach: UNNotificationAttachment?
        do {
//            let attachPath = Bundle.main.pathForResource("avatar", ofType: "jpg")
            let attachPath = Bundle.main.path(forResource: "jordan", ofType: "gif")
            if let urlPath = attachPath {
                let url = URL(fileURLWithPath: urlPath)
                attach = try UNNotificationAttachment(identifier: "identifier",
                                                      url: url,
                                                      options: nil)
            }
        }
        catch {
            assert(false)
            print("can not find the image resource!!!")
        }
        
        if let attachment = attach {
            return [attachment]
        }
        else {
            return []
        }
    }
}

