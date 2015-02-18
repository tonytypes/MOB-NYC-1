//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ThirdViewController: ExerciseViewController {

    // PROBLEM: bottomLayoutGuide doesn't work. It returns 0.0 when I println the length. WTF?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        // Set width, height, color of all boxes
        var boxWandH: CGFloat = 20.0
        var boxWidth = boxWandH
        var boxHeight = boxWandH
        var boxColor = UIColor.blueColor()
        
        var blueBoxOne = UIView()
        var blueBoxTwo = UIView()
        var blueBoxThree = UIView()
        var blueBoxFour = UIView()
        
        for view in [blueBoxOne, blueBoxTwo, blueBoxThree, blueBoxFour] {
            view.backgroundColor = boxColor
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.exerciseView.addSubview(view)
            
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: view,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 1.0,
                constant: boxWidth))
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: view,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 1.0,
                constant: boxHeight))
        }
        
        // Add remaining constraints that aren't alike for all boxes
        
        // blueBoxOne
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxOne,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.topLayoutGuide,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxOne,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        
        // blueBoxTwo
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxTwo,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.topLayoutGuide,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxTwo,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        
        // blueBoxThree
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxThree,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self.bottomLayoutGuide,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxThree,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        
        // blueBoxFour
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxFour,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self.bottomLayoutGuide,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxFour,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        println(bottomLayoutGuide.length)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }

}
