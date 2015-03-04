//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    func didTapNextButton(sender: UIBarButtonItem) {
        saveArray()
        // Perform segue programmatically since I had to change the nextButton action
        performSegueWithIdentifier("goToSixthVC", sender: nil)
    }
    
    let fileName = "saved_array.txt"
    var newArray = [String]()
    
    func appendToArray() {
        var arrayAsString: String = ""
        for anything in textView.text {
            if anything != " " {
                self.newArray.append(String(anything))
            }
        }
    }
    
    
    func saveArray() {
        appendToArray()
        if let folderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            let filePath = folderPath.URLByAppendingPathComponent(self.fileName, isDirectory: false)
            let textToSave = NSArray(array: newArray)
            textToSave.writeToURL(filePath, atomically: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attribute target and action to the nextButton referencing outlet
        nextButton.target = self
        nextButton.action = "didTapNextButton:"
    }
}
