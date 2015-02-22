//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {

    // Declare the greenButton and constraint variables that I'll change throughout this VC
    
    var greenButton = UIButton()
    var gbYCenter = NSLayoutConstraint()
    var gbYMoveUp = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
        Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.
        
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
        
        // Create the green button and add it's original constraints
        
        self.greenButton.backgroundColor = UIColor.greenColor()
        self.greenButton.layer.borderColor = UIColor.redColor().CGColor
        self.greenButton.layer.borderWidth = 2.0
        self.greenButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.greenButton.addTarget(self, action: "greenButtonWasPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.exerciseView.addSubview(self.greenButton)
        
        let greenButtonWidth: CGFloat = 50.0
        let greenButtonHeight: CGFloat = greenButtonWidth
        
        let gbWidth = NSLayoutConstraint(item: self.greenButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: greenButtonWidth)
        let gbHeight = NSLayoutConstraint(item: self.greenButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: greenButtonHeight)
        self.gbYCenter = NSLayoutConstraint(item: self.greenButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        let gbXCenter = NSLayoutConstraint(item: self.greenButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        self.exerciseView.addConstraints([gbWidth, gbHeight, self.gbYCenter, gbXCenter])
        
        // Add the new greenButton constraints that will be added/animated with click.
        
        self.gbYMoveUp = NSLayoutConstraint(item: self.greenButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -20)

        
    }
    
    // Add behaviors for greenButton
    
    func greenButtonWasPressed(sender: UIButton!) {
        self.greenButton.enabled = false
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.exerciseView.removeConstraint(self.gbYCenter)
            self.exerciseView.addConstraint(self.gbYMoveUp)
            self.exerciseView.layoutIfNeeded()
            self.greenButton.backgroundColor = UIColor.redColor()
            }, completion: { finished in
                self.returnToOriginalState()
            }
        )
    }
    
    func returnToOriginalState() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.exerciseView.removeConstraint(self.gbYMoveUp)
            self.exerciseView.addConstraint(self.gbYCenter)
            self.exerciseView.layoutIfNeeded()
            self.greenButton.backgroundColor = UIColor.greenColor()
            }, completion: { finished in
                self.greenButton.enabled = true
            }
        )
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
