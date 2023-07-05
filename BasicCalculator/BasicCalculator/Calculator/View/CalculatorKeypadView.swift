//
//  CalculatorKeypadView.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

//import Combine
import SwiftUI

struct CalculatorKeypadView: View {
    
    @EnvironmentObject var viewModel: CalculationViewModel

    private var gridItemLayout = [GridItem(.adaptive(minimum: 70))]
    private var gridItemLayoutLarge = [GridItem(.adaptive(minimum: 200))]

    private var numericKeys: [String] = {
        var keys: [String] = []
        for each in 0...9 {
            keys.append("Button_\(each)")
        }
        return keys
    }()
    
    private var symbolKeys: [String] = {
        var keys: [String] = []
        for each in ["C", ".", "+", "-", "/", "*"] {
            keys.append("Button_\(each)")
        }
        return keys
    }()
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 5) {
                ForEach(symbolKeys, id: \.self) { eachKey in
                    DigitButton(digit: eachKey, backgroundColor: .black, foreGroundColor: .orange, borderColor: .black)
                }
                ForEach(numericKeys, id: \.self) { eachKey in
                    DigitButton(digit: eachKey, backgroundColor: .black, foreGroundColor: .white, borderColor: .black)
                }
            }
            LazyVGrid(columns: gridItemLayoutLarge, spacing: 5) {
                DigitButton(digit: "Button_=", backgroundColor: .black, foreGroundColor: .gray, borderColor: .black, isLarge: true)
            }
        }
        .padding()
    }
}

struct CalculatorKeypadView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorKeypadView()
    }
}

