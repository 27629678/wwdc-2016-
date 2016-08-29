//
//  ClosureTestRunner.swift
//  Swifty
//
//  Created by hzyuxiaohua on 16/8/29.
//  Copyright © 2016年 XY. All rights reserved.
//

import UIKit

class ClosureTestRunner: TestRunner {
    
    override func run() {
        var aClosure: (String) -> Void
        aClosure = { (name) in
            print(name)
        }
        
        aClosure("hzyuxiaohua")
    }
}
