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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func localNotificationBtnAction(_ sender: AnyObject) {
        let content = UNMutableNotificationContent();
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "this is body field"
        
        do {
//            let attachPath = Bundle.main.pathForResource("avatar", ofType: "jpg")
            let attachPath = Bundle.main.pathForResource("datboi", ofType: "gif")
            if let urlPath = attachPath {
                let url = URL(fileURLWithPath: urlPath)
                let attach = try UNNotificationAttachment(identifier: "identifier",
                                                          url: url,
                                                          options: nil);
                content.attachments = [attach]
            }
        }
        catch {
            print("can not find the image resource!!!")
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let req : UNNotificationRequest = UNNotificationRequest(identifier: "1",
                                                                content: content,
                                                                trigger: trigger)
        UNUserNotificationCenter.current().add(req) { (error) in
            if (error != nil) {
                print(error)
            }
            else {
                print("OK")
            }
        }
    }
}

