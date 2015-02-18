//
//  ViewController.swift
//  Calculator
//
//  Created by Dylan Bisch on 2/9/15.
//  Copyright (c) 2015 DB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calcLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calcLabel.adjustsFontSizeToFitWidth = true
        calcLabel.minimumScaleFactor = 0.000001
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var calc = Calculation()
    
    func clearAll() {
        calcLabel.text = ""
        calc.calcLabelText = calcLabel.text
        calc.storedN = 0.0
        calc.newN = 0
        calc.calcToPerform = ""
        calc.calcJustHit = ""
        calc.clearLabelOnNextN = true
        calc.calcIsLastButtonHit = false
        calc.equalsIsLastCalcPerformed = false
    }
    
    func appendDigit(digit: String) {
        var digitToAppend = digit
        if calc.clearLabelOnNextN == true {
            calcLabel.text = ""
        }
        calcLabel.text = calcLabel.text! + digitToAppend
        calc.clearLabelOnNextN = false
        calc.calcIsLastButtonHit = false
        calc.equalsIsLastCalcPerformed = false
    }
    
    func changePlusMinus() {
        var calcLabelHolder: String = ""
        if let c = calcLabel.text {
            calcLabelHolder = c
        }
        var calcLabelAsFloat: Float = (calcLabelHolder as NSString).floatValue
        if calcLabelAsFloat > 0 {
            calcLabelAsFloat = calcLabelAsFloat - ( calcLabelAsFloat * 2 )
        } else if calcLabelAsFloat < 0 {
            calcLabelAsFloat = calcLabelAsFloat + abs( calcLabelAsFloat * 2 )
        }
        calcLabel.text = "\(calcLabelAsFloat)"
    }

    func changeToPercent() {
        var calcLabelHolder: String = ""
        if let c = calcLabel.text {
            calcLabelHolder = c
        }
        var calcLabelAsFloat: Float = (calcLabelHolder as NSString).floatValue
        calcLabel.text = "\(calcLabelAsFloat / 100)"
    }

    @IBAction func buttonOnePressed(sender: AnyObject) {
        appendDigit("1")
    }
    @IBAction func buttonTwoPressed(sender: AnyObject) {
        appendDigit("2")
    }
    @IBAction func buttonThreePressed(sender: AnyObject) {
        appendDigit("3")
    }
    @IBAction func buttonFourPressed(sender: AnyObject) {
        appendDigit("4")
    }
    @IBAction func buttonFivePressed(sender: AnyObject) {
        appendDigit("5")
    }
    @IBAction func buttonSixPressed(sender: AnyObject) {
        appendDigit("6")
    }
    @IBAction func buttonSevenPressed(sender: AnyObject) {
        appendDigit("7")
    }
    @IBAction func buttonEightPressed(sender: AnyObject) {
        appendDigit("8")
    }
    @IBAction func buttonNinePressed(sender: AnyObject) {
        appendDigit("9")
    }
    @IBAction func buttonZeroPressed(sender: AnyObject) {
        appendDigit("0")
    }
    @IBAction func buttonDecimalPressed(sender: AnyObject) {
        appendDigit(".")
    }
    
    
    @IBAction func buttonDividePressed(sender: AnyObject) {
        calc.calcJustHit = "divide"
        calc.calcLabelText = calcLabel.text
        calcLabel.text = calc.runCalculation()
    }
    @IBAction func buttonMultiplyPressed(sender: AnyObject) {
        calc.calcJustHit = "multiply"
        calc.calcLabelText = calcLabel.text
        calcLabel.text = calc.runCalculation()
    }
    @IBAction func buttonAddPressed(sender: AnyObject) {
        calc.calcJustHit = "add"
        calc.calcLabelText = calcLabel.text
        calcLabel.text = calc.runCalculation()
    }
    @IBAction func buttonSubtractPressed(sender: AnyObject) {
        calc.calcJustHit = "subtract"
        calc.calcLabelText = calcLabel.text
        calcLabel.text = calc.runCalculation()
    }
    
    
    @IBAction func buttonClearPressed(sender: AnyObject) {
        calcLabel.text = ""
        calc.equalsIsLastCalcPerformed = false
        if calc.calcToPerform == "dividedByZero" {
            clearAll()
        }
    }
    
    @IBAction func buttonClearAllPressed(sender: AnyObject) {
        clearAll()
    }
    
    @IBAction func buttonEqualsPressed(sender: AnyObject) {
        calc.calcJustHit = "equals"
        calc.calcLabelText = calcLabel.text
        calcLabel.text = calc.runCalculation()
    }
    
    @IBAction func buttonPlusMinusPressed(sender: AnyObject) {
        changePlusMinus()
    }
    
    @IBAction func buttonPercentPressed(sender: AnyObject) {
        changeToPercent()
    }
    
}

