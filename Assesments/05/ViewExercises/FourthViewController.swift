//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {

    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build a scroll view that takes up the entire screen. 
        
        In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen, a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
        
        Use Autolayout.

        
        Your view should be in self.exerciseView, not self.view.
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

        
        // Set the constraints for the scrollView that was declared at the top of this file
        
        self.exerciseView.addSubview(scrollView)
        self.scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)

        let svTop = NSLayoutConstraint(
            item: scrollView,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: exerciseView,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0
        )
        let svRight = NSLayoutConstraint(
            item: scrollView,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: exerciseView,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: 0
        )
        let svBottom = NSLayoutConstraint(
            item: scrollView,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: exerciseView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0
        )
        let svLeft = NSLayoutConstraint(
            item: scrollView,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: exerciseView,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: 0
        )
        self.view.addConstraints([svTop, svRight, svBottom, svLeft])

        
        // Add all three subviews of scrollView, and their constraints
        
        let blueBoxHeight: CGFloat = 20.0
        let purpleLabelHeight: CGFloat = 1200.0
        let redBoxHeight: CGFloat = 20.0
        
        var blueBox = UIView()
        blueBox.backgroundColor = UIColor.blueColor()
        blueBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(blueBox)
        let bbLeft = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0)
        let bbRight = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0)
        let bbTop = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        let bbHeight = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: blueBoxHeight)
        let bbWidth = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.exerciseView.frame.width - 20.0)

        scrollView.addConstraints([bbLeft, bbRight, bbTop, bbHeight, bbWidth])
        
        
        var purpleLabel = UILabel()
        purpleLabel.backgroundColor = UIColor.purpleColor()
        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        purpleLabel.textColor = UIColor.whiteColor()
        purpleLabel.textAlignment = NSTextAlignment.Center
        purpleLabel.text = "Test White Text"
        scrollView.addSubview(purpleLabel)
        let plLeft = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        let plRight = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        let plTop = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: blueBox, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        let plHeight = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: purpleLabelHeight)
        let plWidth = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.exerciseView.frame.width)
        
        scrollView.addConstraints([plLeft, plRight, plTop, plHeight, plWidth])
        
        
        var redBox = UIView()
        redBox.backgroundColor = UIColor.redColor()
        redBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(redBox)
        let rbLeft = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0)
        let rbRight = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0)
        let rbTop = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: purpleLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        let rbBottom = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        let rbHeight = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: redBoxHeight)
        let rbWidth = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: self.exerciseView.frame.width - 20.0)
        
        scrollView.addConstraints([rbLeft, rbRight, rbTop, rbBottom, rbHeight, rbWidth])
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}
