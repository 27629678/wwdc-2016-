//
//  Human.swift
//  Swifty
//
//  Created by hzyuxiaohua on 8/9/16.
//  Copyright © 2016 XY. All rights reserved.
//

import Foundation

class Human {
    var name = "human"
    var age = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("hello...")
    }
}

class Man: Human {
    var gender: String {
        get {
            return "Male"
        }
    }
    
    override func sayHello() {
        print("Ha Ha Ha ...")
    }
}
