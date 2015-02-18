//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {

    func loadBoxes() {
        
        // Set width, height, color of all boxes
        var boxWandH: CGFloat = 20.0
        var boxWidth = boxWandH
        var boxHeight = boxWandH
        var boxColor = UIColor.blueColor()
        
        // Set top margin based on heights of status bar and navigation bar
        var navBarHeightOpt = self.navigationController?.navigationBar.frame.size.height
        var navBarHeight: CGFloat = 0.0
        if let n = navBarHeightOpt {
            navBarHeight = n
        }
        var statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        var topMargin = navBarHeight + statusBarHeight
        
        // Set bottom margin based on height of toolbar
        var toolbarHeight: CGFloat = self.toolbar.frame.size.height
        var bottomMargin: CGFloat = self.exerciseView.frame.size.height - toolbarHeight - boxHeight
        
        // Set right margin based on width of view
        var rightMargin: CGFloat = self.exerciseView.frame.size.width - boxWidth
        
        
        // For each box, set the frame, color, and add it
        
        var blueBoxOne = UIView(frame: CGRect(x: 0.0, y: topMargin, width: boxWidth, height: boxHeight))
        blueBoxOne.backgroundColor = boxColor
        blueBoxOne.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleBottomMargin
        exerciseView.addSubview(blueBoxOne)
        
        var blueBoxTwo = UIView(frame: CGRect(x: rightMargin, y: topMargin, width: boxWidth, height: boxHeight))
        blueBoxTwo.backgroundColor = boxColor
        blueBoxTwo.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleBottomMargin
        exerciseView.addSubview(blueBoxTwo)
        
        var blueBoxThree = UIView(frame: CGRect(x: rightMargin, y: bottomMargin, width: boxWidth, height: boxHeight))
        blueBoxThree.backgroundColor = boxColor
        blueBoxThree.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleTopMargin
        exerciseView.addSubview(blueBoxThree)
        
        var blueBoxFour = UIView(frame: CGRect(x: 0.0, y: bottomMargin, width: boxWidth, height: boxHeight))
        blueBoxFour.backgroundColor = boxColor
        blueBoxFour.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleTopMargin
        exerciseView.addSubview(blueBoxFour)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        // Grading note: I can't figure out how to dynamically adjust the top margin after the rotation. One solution would be to use notifications, and adjust the topMargin variable with if statement based on landscape vs. portrait. But I think a better solution would be to somehow use the viewWillTransitionToSize function, where the existing topargin variable would recalculate upon rotate. I'm not sure how to apply it, though. Or instead, I could try out the topLayoutGuide helper I used in the ThirdViewController.
        
        // Note to self: Attempt to do this using an array.
        
        loadBoxes()

    }

    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
