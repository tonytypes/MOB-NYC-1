//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextLabel: UILabel!
    @IBAction func addButton(sender: AnyObject) {
        let addItForLabel = addIt()
        addTextLabel.text = "\(addItForLabel.0)"
    }

    var currentNumber: Float = 0

    func addIt() -> Float {
        let numberToAdd = (textField.text as NSString).floatValue
        currentNumber = currentNumber + numberToAdd
        return currentNumber
    }
    
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
