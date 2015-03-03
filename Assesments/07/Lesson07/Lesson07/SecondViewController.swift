//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var settingsSliderValue = NSUserDefaults.standardUserDefaults().floatForKey("settings_slider")
        var settingsNameValue = NSUserDefaults.standardUserDefaults().stringForKey("settings_name")
        textView.text = "\(textView.text) \n\nsettings_slider value: \(settingsSliderValue) \nsettings_name value: \(settingsNameValue)"
        
        // Do any additional setup after loading the view.
    }
}
