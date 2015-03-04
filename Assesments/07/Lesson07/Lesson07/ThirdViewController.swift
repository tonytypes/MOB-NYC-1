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
    @IBOutlet weak var nextButton: UIBarButtonItem!
    func didTapNextButton(sender: UIBarButtonItem) {
        saveViewText()
        // Perform segue programmatically since I had to change the nextButton action
        performSegueWithIdentifier("goToFourthVC", sender: nil)
    }
    let fileName = "saved_text.txt"
    
    func saveViewText() {
        if let folderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            let filePath = folderPath.URLByAppendingPathComponent(self.fileName, isDirectory: false)
            let textToSave = NSString(string: textView.text)
            textToSave.writeToURL(filePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attribute target and action to the nextButton referencing outlet
        nextButton.target = self
        nextButton.action = "didTapNextButton:"
    }
    
}
