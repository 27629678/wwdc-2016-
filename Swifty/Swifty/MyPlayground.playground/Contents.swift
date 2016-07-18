//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func caculation(origin a: Int, target b: Int) -> Int {
    return a - b
}

var c = caculation(origin: 1, target: 2)

var image = UIImage(named:"1.png")


if #available(iOS 8.3, *) {
    
}
else if #available(OSX 10.0, *) {
    var a: Int?
    
    caculation(origin: a!, target: 0)
}
