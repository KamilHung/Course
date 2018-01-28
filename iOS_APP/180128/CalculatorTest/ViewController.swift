//
//  ViewController.swift
//  CalculatorTest
//
//  Created by David Chang on 20/01/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var display: UILabel!
    
    var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle! //button title
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit //first number ex:123 + 456 is 1 and 4
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
        
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    
}

