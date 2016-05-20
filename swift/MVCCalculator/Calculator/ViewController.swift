//
//  ViewController.swift
//  Calculator
//
//  Created by sawyerhuang on 16/4/13.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numDisplay: UILabel!
    var userIsInTheMiddleOfTypingANumber:Bool = false
    var brain = CalculatorBrain()
    
    @IBAction func appendNumber(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        numDisplay.text = numDisplay.text! + digit
        } else {
            numDisplay.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func numEnter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            numEnter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    

    var displayValue:Double {
        get {
            return NSNumberFormatter().numberFromString(numDisplay.text!)!.doubleValue
        }
        set {
            numDisplay.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
     
      
}

}