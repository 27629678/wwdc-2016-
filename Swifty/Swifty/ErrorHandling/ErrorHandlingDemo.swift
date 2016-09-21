//
//  ErrorHandlingDemo.swift
//  Swifty
//
//  Created by hzyuxiaohua on 8/26/16.
//  Copyright © 2016 XY. All rights reserved.
//

import Foundation

enum IntParsingError: Error {
    case Overflow
    case InvalidInput(String)
}

class MyInt {
    
    var str: String?
    
    init(validating input: String) throws {
        if true {
            throw IntParsingError.InvalidInput(input)
        }
        
        self.str = input
    }
    
}

class ErrorHandlingTestRunner: TestRunner {
    override func run() {
        do {
            let a = try MyInt(validating: "$100")
            print("\(a)")
        }
        catch IntParsingError.InvalidInput(let invalid) {
            print("invalid strng:\(invalid)")
        }
        catch {
            print("error")
        }
    }
}
