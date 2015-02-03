//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        todoViewController?.todos.append(textField.text)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
        
        // Here we're creating a listener for a notification.
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserverForName(UIKeyboardDidShowNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            // This code runs when the first variable after the "(" is posted.
            self.textField.backgroundColor = UIColor.redColor()
        }
        // Rudd admits that this is a little bit confusing.
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        textField.placeholder = "email@domain.com"
    }
    
    // When you do this, the compiler will look for the textField variable within its latest bracket, won't find it, and will change the variable that's declared more globally, and perform the action on it. The other way would ensure that only the textField that's being edited is the one that gets the placeholder added to it.
    /*
    func textFieldDidBeginEditing(textFieldThatEdited: UITextField) {
        textField.placeholder = "email@domain.com"
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

