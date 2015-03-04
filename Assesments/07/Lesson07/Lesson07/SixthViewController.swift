
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    let fileName = "saved_array.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let folderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            let filePath = folderPath.URLByAppendingPathComponent(self.fileName, isDirectory: false)
            if let savedFileText = NSArray(contentsOfURL: filePath) {
                textView.text = "\(textView.text) \n\ncontents of flat file: \n\(savedFileText)"
            }
        }
        
    }
}
