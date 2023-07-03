//
//  BasicCalculatorApp.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

import SwiftUI

@main
struct BasicCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculationViewModel())
                .background(Color.accentColor)
        }
    }
}
