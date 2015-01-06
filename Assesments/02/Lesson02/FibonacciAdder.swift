//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Tony Ruiz on 1/5/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class FibonacciAdder: NSObject {
    
    func fibonacciNumberAtIndex (indexOfFibonacciNumber: Int) -> String {
        var counter = 2
        var prevPrevN = 0
        var prevN = 1
        var newN = 1
        if indexOfFibonacciNumber > 2 {
            while counter < indexOfFibonacciNumber {
                counter = counter + 1
                newN = prevN + prevPrevN
                prevPrevN = prevN
                prevN = newN
            }
            return String(newN)
        } else if indexOfFibonacciNumber == 2 {
            return String(1)
        } else if indexOfFibonacciNumber == 1 {
            return String(0)
        } else {
            return "You've entered an invalid number"
        }
    }

}
