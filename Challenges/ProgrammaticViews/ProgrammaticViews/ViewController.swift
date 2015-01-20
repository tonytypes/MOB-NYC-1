//
//  ViewController.swift
//  ProgrammaticViews
//
//  Created by trvslhlt on 1/7/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let widget: UIButton
  
  override init() {
    widget = UIButton()
    super.init(nibName: nil, bundle: nil)
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupWidget()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupWidget() {
    let spacingToTop: CGFloat = 20
    let width: CGFloat = 50
    let height = width
    let corners: CGFloat = 10.0
    self.view.addSubview(widget)
    widget.setTranslatesAutoresizingMaskIntoConstraints(false)
    let widthConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width)
    let heightConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height)
    let leftConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 0.0)
    let topConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: spacingToTop)
    self.view.addConstraints([widthConstraint, heightConstraint, leftConstraint, topConstraint])
    
    widget.backgroundColor = UIColor.greenColor()
    /*
    TODO ONE: Here is the rounded corners code. I found this piece meal online. This one resource had these lines written with "set" first. (e.g.: setCornerRadius). For some reason, that didn't work. Why? (Source:  http://www.cimgf.com/2010/01/28/fun-with-uibuttons-and-core-animation-layers/ .) Additionally, why does this have to be a "layer" variable, rather than an NSLayoutConstraint?
    */
    widget.layer.cornerRadius = corners
    widget.layer.masksToBounds = true
    
    /*
    TODO TWO: A few things confuse me. First, why the weird syntax for the action field in addTarget? It required a colon. Second, in my func (which I call buttonPress), why can't I enter widget into the sender field? I assumed I coudl because that's the var I declared. Third, why does my buttonPress func have to be outside of the setupWidget func? It didn't work when I had it inside.
    */
    widget.addTarget(self, action: "buttonPress:", forControlEvents: UIControlEvents.TouchUpInside)
  }
  
  func buttonPress(sender:UIButton!) {
    println("Button pressed")
  }

  
}
