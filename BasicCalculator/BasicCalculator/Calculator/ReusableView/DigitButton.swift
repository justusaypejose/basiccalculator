//
//  DigitButton.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

import SwiftUI

struct DigitButton: View {
    
    @EnvironmentObject var viewModel: CalculationViewModel
    @State var isTapped: Bool = false
    
    let digit: String
    let backgroundColor: Color
    let foreGroundColor: Color
    let borderColor: Color
    var isLarge: Bool = false
    
    var body: some View {
        
        Button(action: {
            // Animate the tap.
            self.isTapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                withAnimation {
                    self.isTapped = false
                }
            }
            if buttonValue(digit).caseInsensitiveCompare("C") == .orderedSame {
                self.viewModel.reset()
            } else {
                self.viewModel.updateCalculation(buttonValue(digit))
            }
        }) {
            Text(LocalizedStringKey(stringLiteral: digit))
                .font(.custom("3x5", size: 44))
                .frame(width: isLarge ? 150 : 50)
                .padding()
                .foregroundColor(fontColor())
                .background(background())
                .cornerRadius(10)
        }
        .padding(.all, 3)
        .accessibilityLabel(Text(LocalizedStringKey(stringLiteral: digit)))
        .accessibilityIdentifier(digit)
    }
    
    private func buttonValue(_ buttonTitle: String) -> String {
        buttonTitle.replacingOccurrences(of: "Button_", with: "")
    }

    private func fontColor() -> Color {
       !self.isTapped ? foreGroundColor : backgroundColor
    }
    
    private func background() -> Color {
        self.isTapped ? foreGroundColor : backgroundColor
    }
}

struct DigitButton_Previews: PreviewProvider {
    static var previews: some View {
        DigitButton(digit: "Button_5", backgroundColor: .red, foreGroundColor: .yellow, borderColor: .black)
    }
}
