//
//  FirstViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FirstViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a red box (10px tall, the width of the screen) with a black border on the very top of the screen below the nav bar,
        and a black box with a red border on the very bottom of the screen (same dimensions), above the toolbar.
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        
        // Set width and height of both boxes, and border widths too
        var boxWidth: CGFloat = self.exerciseView.frame.size.width
        var boxHeight: CGFloat = 10.0
        var boxBorderWidth: CGFloat = 1.0
        
        // Set top margin based on heights of status bar and navigation bar
        var navBarHeightOpt = self.navigationController?.navigationBar.frame.size.height
        var navBarHeight: CGFloat = 0.0
        if let n = navBarHeightOpt {
            navBarHeight = n
        }
        var statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        var topMargin = navBarHeight + statusBarHeight
        
        // Set bottom margin based on height of toolbar
        // To do this, I had to modify ExerciseViewController to initialize the toolbar variable outside of viewDidLoad. Doing so allowed me to reference the properties of toolbar below.
        var toolbarHeight: CGFloat = self.toolbar.frame.size.height
        var bottomMargin: CGFloat = self.exerciseView.frame.size.height - toolbarHeight - boxHeight
        
        var redBox = UIView(frame: CGRect(x: 0.0, y: topMargin, width: boxWidth, height: boxHeight))
        redBox.backgroundColor = UIColor.redColor()
        redBox.layer.borderWidth = boxBorderWidth
        redBox.layer.borderColor = UIColor.blackColor().CGColor
        redBox.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin
        exerciseView.addSubview(redBox)
        
        var blackBox = UIView(frame: CGRect(x: 0.0, y: bottomMargin, width: boxWidth, height: boxHeight))
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.layer.borderWidth = boxBorderWidth
        blackBox.layer.borderColor = UIColor.redColor().CGColor
        blackBox.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin
        exerciseView.addSubview(blackBox)
        
    }
    
    // To self: below is an alternate way of calling the height of all of the stuff at the top of the screen. Note that bottomLayoutGuide can be used for the bottom of the screen.
    
    /*
    override func viewDidAppear(animated: Bool) {
        var test: CGFloat = self.topLayoutGuide.length
        println(test)
    }
    */

    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func next() {
        self.performSegueWithIdentifier("two", sender: nil)
    }
}
