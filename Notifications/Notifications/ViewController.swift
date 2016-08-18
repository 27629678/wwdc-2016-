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
    
    @IBAction func updateBtnAction(_ sender: AnyObject) {
        updateNotification("1")
    }
    
    @IBAction func revokeBtnAction(_ sender: AnyObject) {
        revokeNotification("1")
    }
}

