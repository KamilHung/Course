//
//  ViewController.swift
//  Calculator
//
//  Created by cycu on 2018/1/21.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle! //Button Title save to digit
        if userIsInTheMiddleOfTyping == true{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    var displayValue: Double{
        get{
            return (Double(display.text!))!
        }
        
        set{
            display.text = String(newValue)
        }
    }
    
    var brain = CalculatorBrain() //link to CalculatorBrain.swift

    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping == true{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        //let mathematicalSymbol = sender.currentTitle! =>
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
}

