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
    var operandStack = Array<Double>()
    
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
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
        case "÷": performOperation { $1 / $0 }
        case "×": performOperation { $0 * $1 }
        case "-": performOperation { $1 - $0 }
        case "+": performOperation { $0 + $1 }
        case "√": performOperation { sqrt($0) }
        default:
            break
        }
        
    }
    
     @objc (performOperationWithTwoOperand:) func performOperation(operation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            numEnter()
        }
    }
    
    @objc (performOperationWithOneOperand:) func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            numEnter()
        }
    }
//
//    func multiply(op1:Double, op2:Double) -> Double {
//        return op1 * op2
//    }
//    
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