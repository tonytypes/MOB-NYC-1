//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {

    // Self: Take a stab at replacing the storyboard text box and add button with programmatic subViews for each.
    
    var tableView: UITableView = UITableView()

    @IBOutlet weak var textBox: UITextField!
    
    var array: [String] = []
    
    func addItem() {
        var textToAdd = textBox.text
        if textToAdd != "" {
            array.append(textToAdd)
            tableView.reloadData()
            clearAddItemError()
            clearAllTextBoxes()
        } else {
            addItemError()
        }
    }
    
    func addItemError() {
        // Display an error message inside of the text box
        textBox.attributedPlaceholder = NSAttributedString(string:"cannot be blank",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
    }
    
    func clearAddItemError() {
        // Clears of an addItemError, if it exists
        textBox.attributedPlaceholder = NSAttributedString(string:"new item",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }
    
    func clearAllTextBoxes() {
        textBox.text = ""
    }
    
    @IBAction func addButton(sender: AnyObject) {
        addItem()
    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        addItem()
        return true;
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textBox.delegate = self
        
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
        let view_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-150-[tableView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)

        /*
        TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
        TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
        
        */
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.array[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}





