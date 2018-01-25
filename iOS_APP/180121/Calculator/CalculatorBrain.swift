//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by cycu on 2018/1/21.
//  Copyright © 2018年 cycu. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        //"𝜋": Double.pi,
        //"e": M_E,
        //"√": sqrt //Double, but sqrt not Double
        "𝜋": Operation.Constant(Double.pi),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "sin": Operation.UnaryOperation(sin)
    ]
    
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double) -> Double)
        case Equals((Double) -> Double)
    }
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
                case Operation.Constant(let associatedConstantValue):
                    accumulator = associatedConstantValue
                    break
                case Operation.UnaryOperation(let function):
                    accumulator = function(accumulator)
                    break
                case Operation.BinaryOperation(let function):
                    accumulator = function(accumulator)
                    break
                case Operation.Equals:
                    break
            }
        }
    }
    
    var result: Double{
        get{
            return accumulator  //return to ViewController.swift
        }
        
        set{
            
        }
    }
}
