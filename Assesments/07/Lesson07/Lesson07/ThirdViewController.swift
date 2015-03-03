//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func didTapNextButton(sender: UIBarButtonItem) {
        println("did tap button")
    }

    @IBOutlet weak var nextButton: UIBarButtonItem!
    

    
    func saveViewText() {
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory( .DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            let filePath = documentPath.URLByAppendingPathComponent("savedViewText.txt",isDirectory: false)
            var textToSave = textView.text
            textToSave.writeToURL(filePath, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
            println("saved \n\n\(textToSave)")
        }
    }

    /*
    func saveText() {
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            
            let filePath = documentPath.URLByAppendingPathComponent("sample.txt", isDirectory: false)
            let displayText = NSString(string: ThirdTextView.text)
            
            displayText.writeToURL(filePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
            
        } // end documentPath
    }
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveViewText()
                
        nextButton.target = self
        nextButton.action = "printMessage:"
        func printMessage(sender: UIBarButtonItem) {
            println("next button was pressed")
        }
    }
}
