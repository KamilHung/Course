//
//  CalculatorBrain.swift
//  CalculatorTest
//
//  Created by David Chang on 20/01/2018.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0  // 3
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(Double.pi),
        "e": Operation.Constant(M_E),
        "CE": Operation.Constant(0),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "sin": Operation.UnaryOperation(sin),
        "tan": Operation.UnaryOperation(tan),
        "±": Operation.UnaryOperation({ -$0 }),
        
        "x": Operation.BinaryOperation({ $0 * $1}), //op1 * op2
        "÷": Operation.BinaryOperation({ $0 / $1}),
        "+": Operation.BinaryOperation({ $0 + $1}),
        "-": Operation.BinaryOperation({ $0 - $1}),
        
        "=": Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function  /* $0+$1 */):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }

    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    
    
    
    
    
    
    
    
    
}
