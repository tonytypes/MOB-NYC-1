//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {

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
        
        var scrollView = UIScrollView()
        self.exerciseView.addSubview(scrollView)

        view.addConstraint(NSLayoutConstraint(
            item: scrollView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: scrollView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Height,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: scrollView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0))
        view.addConstraint(NSLayoutConstraint(
            item: scrollView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.topLayoutGuide,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0))

        
        
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
