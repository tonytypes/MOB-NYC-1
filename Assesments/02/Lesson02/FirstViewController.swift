//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var genTextLabel: UILabel!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!

    
    @IBAction func genTextButton(sender: AnyObject) {
        // TODO one:
        genTextLabel.text = helloWorld()
        
        // Note that the outputs of TODOs 2-4 are printlns, which I think is what the instructions said. The outputs won't show up in the textLabel.
        
        // TODO two:
        nameAndAge()
        /*
        // Alternate way of doing TODO two. Question: Which is better and why?
        let nameAndAgeText = nameAndAge()
        println("Hello \(nameAndAgeText.0), you are \(nameAndAgeText.1) years old!")
        */
        
        // TODO three:
        drinkVoteDriveStatusSeparately()
        
        // TODO four:
        drinkVoteDriveStatusTogether()
        
    }
    
    // TODO one:
    func helloWorld() -> String {
        return "hello world!"
    }
    

    // TODO two:
    func nameAndAge() {
        let name = textFieldOne.text
        let age = textFieldTwo.text
        println("Hello \(name), you are \(age) years old!")
    }
    // Question for instructors: Why can't the statement "let name = textFieldOne.text" exist inside the class?
    // Why does it have to exist inside of the function?
    
    /*
    // Alternate way of doing TODO two.
    func nameAndAge() -> (String, String) {
        let name = textFieldOne.text
        let age = textFieldTwo.text
        return (name, age)
    }
    */
    
    // TODO three:
    // Note: I used "greater than or equal to" in ifs because I believe it's best, although the not explicit in TODO.
    func drinkVoteDriveStatusSeparately() {
        let age = textFieldTwo.text.toInt()
        if age >= 21 {
            println("You can drink")
        }
        if age >= 18 {
            println("You can vote")
        }
        if age >= 16 {
            println("You can drive")
        }
    }
    
    // TODO four:
    // Note: I used "greater than or equal to" in ifs because I believe it's best, although the not explicit in TODO.
    // Note: I also setup my ifs and elses differently than in class, but it makes more sense to me this way.
    func drinkVoteDriveStatusTogether() {
        let age = textFieldTwo.text.toInt()
        if age >= 16 {
            if age < 18 {
            println("You can drive")
            } else if age < 21 {
                println("You can drive and vote")
            } else {
                println("You can drive, vote and drink (but not at the same time!)")
            }
        }
    }
    
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!
    
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
}
