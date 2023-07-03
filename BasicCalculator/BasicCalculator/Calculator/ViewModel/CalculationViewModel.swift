//
//  CalculationViewModel.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

import SwiftUI

final class CalculationViewModel: ObservableObject {
    
    @Published var calculation: Calculation = Calculation()

    init(result: Double = 0.0) {
        self.calculation.result = result
        self.calculation.resultStack = ""
    }
    
    func reset() {
        self.calculation.result = 0.0
        self.calculation.resultStack.removeAll()
    }
    
    func updateCalculation(_ value: String) {
        self.calculation.resultStack.append(value)
    }
    
    func result() -> String {
        self.calculation.resultStack.isEmpty ? "0.0" : self.calculation.resultStack
    }
    
    func resultToShow() -> String {
        String(format: "%.2f", self.calculation.result)
    }
}
