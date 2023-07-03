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

//    @State var cancellables = Set<AnyCancellable>()
    private var gridItemLayout = [GridItem(.adaptive(minimum: 70))]
    
    private var numericKeys: [String] = {
        var keys: [String] = []
        for each in 0...9 {
            keys.append("Button_\(each)")
        }
        for each in ["C", "%", ".", "+", "-", "/", "*", "=", "(", ")"] {
            keys.append("Button_\(each)")
        }
        return keys
    }()
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 5) {
                ForEach(numericKeys, id: \.self) { eachKey in
                    DigitButton(digit: eachKey, backgroundColor: .black, foreGroundColor: .white, borderColor: .black)
                }
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

