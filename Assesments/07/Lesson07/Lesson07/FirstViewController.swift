//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var testString = NSUserDefaults.standardUserDefaults().stringForKey("test_string")
        var testNumber = NSUserDefaults.standardUserDefaults().integerForKey("test_number")
        textView.text = "\(textView.text) \n\ntest_string: \(testString) \ntest_number: \(testNumber)"
    }
}