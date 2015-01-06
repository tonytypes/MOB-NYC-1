//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func calcButton(sender: AnyObject) {
        
        let input = textField.text.toInt()
        if let inp = input {
            let adder = FibonacciAdder()
            let number = adder.fibonacciNumberAtIndex(inp)
            label.text = number
            // I've written the println below because I think the instructions said to
            println(number)
        }
    
    }

    
    // Questions for instructors:
    // I was confused about the placement of classes (and functions,
    // for that matter). Depending on where I placed my FibonacciAdder
    // class, I sometimes got an error on the line where I tried to
    // retrieve it, saying that I had to declare the "local variable"
    // before trying to retrieve it. I'd like to better understand
    // that sort of thing.
    
    
    /*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
}
