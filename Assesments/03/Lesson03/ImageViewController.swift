//
//  ImageViewController.swift
//  Lesson03
//
//  Created by Tony Ruiz on 1/24/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = UIColor.whiteColor()
        // Note: I played around a semi-transparent background, but it didn't work:
        // view.backgroundColor = UIColor(red:1.0,green:1.0,blue:1.0,alpha:0.7)
        
        // Diplay image
        let imageForModalName = "imageForModal.jpg"
        let imageForModal = UIImage(named: imageForModalName)
        let imageForModalView = UIImageView(image: imageForModal!) // why the "!" ?
        imageForModalView.frame = CGRect(x: 0, y: 20, width: 200, height: 240)
        view.addSubview(imageForModalView)
        
        // Create dismiss button
        let dismissButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        dismissButton.setTitle("Close", forState: .Normal)
        dismissButton.frame = CGRectMake(0,260,70,30)
        dismissButton.addTarget(self, action: "dismissTheModal", forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        
        // Do any additional setup after loading the view.

    }

    func hello() {
        view.constraints
    }
    
    // Dismiss this modal
    func dismissTheModal(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func dismissImage(sender: AnyObject) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
  

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
