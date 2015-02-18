//
//  Calculation.swift
//  Calculator
//
//  Created by Tony Ruiz on 2/16/15.
//  Copyright (c) 2015 DB. All rights reserved.
//

import UIKit

class Calculation: NSObject {
   
    //////////
    // These are all of the variables that will sometimes be referenced in the VC.
    
    // This is the number we start with
    var storedN: Float = 0.0
    
    // This is the new number
    var newN: Float = 0.0
    
    // This is the operation to perform
    var calcToPerform: String = ""
    
    // This is the operation that was just hit
    var calcJustHit: String = ""
    
    // This will help us control if we should clear the label when a new digit is pressed
    var clearLabelOnNextN: Bool = true
    
    // This will help us control differences in how the numbers are calculated when a calculation button is hit consecutively versus non-consecutively
    var calcIsLastButtonHit: Bool = false
    
    // This will help us control differences in how the numbers are calculated when equals was the last actual calculation performed. It is set to false when a digit, C or AC is pressed
    var equalsIsLastCalcPerformed: Bool = false
    
    var calcLabelText: String?
    
    //////////
    // This is where the main function for running a calculation begins.
    
    func runCalculation() -> String {
        
        // Create a variable to let me use calcLabel as a Float
        var calcLabelHolder: String = ""
        if let c = calcLabelText {
            calcLabelHolder = c
        }
        
        if calcIsLastButtonHit == false {
            // Save what's in the textLabel as a Float inside of variable newN
            newN = (calcLabelHolder as NSString).floatValue
        }
        
        if equalsIsLastCalcPerformed == true {
            calcToPerform = "equals"
        }
        
        if calcToPerform == "dividedByZero" {
            clearLabelOnNextN = true
            calcIsLastButtonHit = true
            println(storedN)
            println(newN)
            println(calcToPerform)
            println(calcJustHit)
            println(calcLabelText)
            return "Not a number"
        }
        
        // Save the calculation for the button that was just selected and reset a few key variables
        if calcToPerform == "add" {
            storedN = add(storedN, n: newN)
            clearLabelOnNextN = true
            calcIsLastButtonHit = true
            calcToPerform = calcJustHit
            return "\(storedN)"
        }
        if calcToPerform == "subtract" {
            storedN = subtract(storedN, n: newN)
            clearLabelOnNextN = true
            calcIsLastButtonHit = true
            calcToPerform = calcJustHit
            return "\(storedN)"
        }
        if calcToPerform == "multiply" {
            storedN = multiply(storedN, n: newN)
            clearLabelOnNextN = true
            calcIsLastButtonHit = true
            calcToPerform = calcJustHit
            return "\(storedN)"
        }
        if calcToPerform == "" {
            storedN = newN
            clearLabelOnNextN = true
            calcIsLastButtonHit = true
            calcToPerform = calcJustHit
            return "\(storedN)"
        }
        if calcToPerform == "equals" {
            clearLabelOnNextN = true
            calcIsLastButtonHit = true
            calcToPerform = calcJustHit
            equalsIsLastCalcPerformed = true
            return "\(storedN)"
        }
        if calcToPerform == "divide" {
            if newN != 0 {
                storedN = divide(storedN, n: newN)
                clearLabelOnNextN = true
                calcIsLastButtonHit = true
                calcToPerform = calcJustHit
                return "\(storedN)"
            } else {
                calcToPerform = "dividedByZero"
                clearLabelOnNextN = true
                calcIsLastButtonHit = true
                return "Not a number"
            }
        }
        return "\(storedN)"
    }

    //////////
    // These are all the functions that contain the various calculations possible.
    
    func add(s: Float, n: Float) -> Float {
        var s: Float = s + n
        return s
    }
    
    func subtract(s: Float, n: Float) -> Float {
        var s: Float = s - n
        return s
    }
    
    func multiply(s: Float, n: Float) -> Float {
        var s: Float = s * n
        return s
    }
    
    func divide(s: Float, n: Float) -> Float {
        var s: Float = s / n
        return s
    }
    
}
