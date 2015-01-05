//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func calculateButton(sender: AnyObject) {
        label.text = oddOrEven()
    }
    
    func oddOrEven() -> String {
        var number = numberField.text
        var convertedNumber = number.toInt()
        var remainder: Int = 0
        if let int = convertedNumber {
            remainder = int % 2
        }
        if convertedNumber != nil {
            if remainder == 0 {
                return "is even"
            } else {
                return "is not even"
            }
            
        } else {
            return "You must enter an integer"
        }
    }
    
    
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
}
