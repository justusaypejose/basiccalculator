//
//  Operator.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 05/07/23.
//

import Foundation

enum Operator {
    case none
    case addition
    case subtraction
    case multiplication
    case division
    
    static func operation(symbol: String) -> Operator {
        switch symbol {
        case "+":
            return .addition
        case "-":
            return .subtraction
        case "*":
            return .multiplication
        case "/":
            return .division
        default:
            return .none
        }
    }
}
