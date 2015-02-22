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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = UIColor.blueColor()
        // exerciseView.backgroundColor = UIColor.redColor()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        
        // Find and set the height of the bottom toolbar in view
        var toolbarHeight: CGFloat = self.toolbar.frame.size.height
        
        // Set constraints for exerciseView so that it accounts for topLayoutGuide and the bottom toolbar. This way, all its subviews can reflect these as well.

        exerciseView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let evTop = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topLayoutGuide,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0
        )
        let evRight = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: 0
        )
        let evBottom = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: bottomLayoutGuide,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: -toolbarHeight
        )
        let evLeft = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: 0
        )
        
        self.view.addConstraints([evTop, evRight, evBottom, evLeft])
        
        // Set width, height, color of all boxes
        var boxWandH: CGFloat = 20.0
        var boxWidth = boxWandH
        var boxHeight = boxWandH
        var boxColor = UIColor.blueColor()
        
        var blueBoxOne = UIView()
        var blueBoxTwo = UIView()
        var blueBoxThree = UIView()
        var blueBoxFour = UIView()
        
        // Set the all common constraints for boxes
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
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxOne,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxOne,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        
        // blueBoxTwo
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxTwo,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxTwo,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        
        // blueBoxThree
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxThree,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxThree,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0))
        
        // blueBoxFour
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxFour,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueBoxFour,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }

}
