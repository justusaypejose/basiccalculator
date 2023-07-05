//
//  CalculationViewModel.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

import SwiftUI

final class CalculationViewModel: ObservableObject {
    
    @Published var calculation: Calculation = Calculation()
    private var currentNumber = ""
    private var currentOperator: Operator = .none
    private var storedNumber: Double = 0
    private var hasDecimalPoint = false

    init(result: Double = 0.0) {
        self.calculation.resultStack = ""
    }
    
    func reset() {
        self.calculation.resultStack.removeAll()
        currentNumber = ""
        currentOperator = .none
        storedNumber = 0
        hasDecimalPoint = false
    }
    
    func updateCalculation(_ value: String) {
        self.handleButtonPress(buttonTitle: value)
    }
    
    func result() -> String {
        self.calculation.resultStack.isEmpty ? "0.0" : self.calculation.resultStack
    }
    
    func resultToShow() -> String {
        self.calculation.resultStack.isEmpty ? "0.0" : self.calculation.resultStack
    }
}

extension CalculationViewModel {

    func handleButtonPress(buttonTitle: String) {
         if let number = Double(buttonTitle) {
             handleNumberButtonPress(number)
         } else if buttonTitle == "." {
             handleDecimalButtonPress()
         } else {
             handleOperatorButtonPress(buttonTitle)
         }
     }

     private func handleNumberButtonPress(_ number: Double) {
         if currentNumber == "0" {
             currentNumber = ""
         }
         currentNumber += String(format: "%.0f", number)
         self.calculation.resultStack = currentNumber
     }

     private func handleDecimalButtonPress() {
         if !hasDecimalPoint {
             currentNumber += "."
             self.calculation.resultStack = currentNumber
             hasDecimalPoint = true
         }
     }

     private func handleOperatorButtonPress(_ operatorTitle: String) {
         switch operatorTitle {
         case "+", "-", "*", "/", "=":
             performCalculation()
             currentOperator = Operator.operation(symbol: operatorTitle)
         case "C":
             reset()
         default:
             break
         }
     }

     private func performCalculation() {
         guard let number = Double(currentNumber) else { return }
         switch currentOperator {
         case .addition:
             storedNumber += number
         case .subtraction:
             storedNumber -= number
         case .multiplication:
             storedNumber *= number
         case .division:
             storedNumber /= number
         case .none:
             storedNumber = number
         }
         currentNumber = ""
         self.calculation.resultStack = String(storedNumber)
     }
}
