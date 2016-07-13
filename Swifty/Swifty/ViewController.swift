//
//  ViewController.swift
//  Swifty
//
//  Created by hzyuxiaohua on 7/13/16.
//  Copyright © 2016 XY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var targetVC : XYViewController?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func localeDescription() -> String {
        return "hello, world!"
    }
}

