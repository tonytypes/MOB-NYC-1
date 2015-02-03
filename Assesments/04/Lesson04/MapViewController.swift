//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    var tableView: UITableView = UITableView()
    
    @IBOutlet weak var keyTextField: UITextField!
    
    @IBOutlet weak var valueTextField: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    var dicti: [String:String] = [:]
    
    func addItem() {
        var keyToAdd = keyTextField.text
        var valueToAdd = valueTextField.text
        if keyToAdd != "" && valueToAdd != "" {
            dicti[keyToAdd] = valueToAdd
            tableView.reloadData()
            clearAllTextBoxes()
            clearAddItemError()
        } else {
            addItemError()
        }
    }

    func addItemError() {
        // Display an error message outside of the text boxes, in a label
        errorMessage.text = "fields cannot be blank"
    }
    
    func clearAddItemError() {
        errorMessage.text = ""
    }
    
    func clearAllTextBoxes() {
        keyTextField.text = ""
        valueTextField.text = ""
    }
    
    
    @IBAction func addToDicti(sender: AnyObject) {
        addItem()
    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        addItem()
        return true;
    }
    
    // Turn the keys into an array
    var keysArray:[String] {
        get{
            return Array(dicti.keys)
        }
    }
    
    // Turn the values into an array
    var valuesArray:[String] {
        get{
            return Array(dicti.values)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keyTextField.delegate = self
        self.valueTextField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(tableView)
        
        let viewsDictionary = ["tableView":tableView]
        let tableView_constraint_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[tableView(>=50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let tableView_constraint_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[tableView(>=50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        tableView.addConstraints(tableView_constraint_H)
        tableView.addConstraints(tableView_constraint_V)
        
        let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-220-[tableView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)
        
        var backgroundColorOnShow = UIColor.blueColor()
        var backgroundColorOnHide = UIColor.redColor()
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserverForName(UIKeyboardDidShowNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
                self.keyTextField.backgroundColor = backgroundColorOnShow
                self.valueTextField.backgroundColor = backgroundColorOnShow
        }
        notificationCenter.addObserverForName(UIKeyboardDidHideNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            self.keyTextField.backgroundColor = backgroundColorOnHide
            self.valueTextField.backgroundColor = backgroundColorOnHide
        }

        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.keysArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = "Key: \(self.keysArray[indexPath.row]), Value: \(self.valuesArray[indexPath.row])"
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}




