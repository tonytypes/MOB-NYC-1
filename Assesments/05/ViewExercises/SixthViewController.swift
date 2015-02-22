//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 6"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.exerciseView.addSubview(tableView)
        self.tableView.frame = self.exerciseView.frame
        self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController!.navigationBar.frame), 0, 0, 0)
        self.tableView.autoresizingMask = self.exerciseView.autoresizingMask
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        /* TODO:
        The table view cells on this screen are blank.
        
        Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
        */
        
        // Create a label, for which there'll be an instance made for each row
        
        func createRowLabel(text: Int) {
            let rowLabel = UILabel()
            rowLabel.backgroundColor = UIColor.greenColor()
            rowLabel.text = "Row \(text)"
            rowLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
            cell?.addSubview(rowLabel)
            
            let rlYCenter = NSLayoutConstraint(item: rowLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
            let rlXCenter = NSLayoutConstraint(item: rowLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
            
            cell?.addConstraints([rlYCenter, rlXCenter])
        }
        
        createRowLabel(indexPath.row)
        
        return cell!
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
