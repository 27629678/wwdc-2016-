//
//  ClassesTestRunner.swift
//  Swifty
//
//  Created by hzyuxiaohua on 8/9/16.
//  Copyright © 2016 XY. All rights reserved.
//

import Foundation

class ClassTestRunner: TestRunner {
    override func run() {
        let human = Human(name: "yuxiaohua", age: 19)
        print(human.name)
        human.sayHello()
        
        let aMan = Man(name: "yuxiaohua", age: 29)
        print("gender:\(aMan.gender)")
        aMan.sayHello()
    }
}
