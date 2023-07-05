//
//  CalculatorOutputView.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

import SwiftUI

struct CalculatorOutputView: View {
    @EnvironmentObject var viewModel: CalculationViewModel
    let backgroundColor: Color = .white
    let foreGroundColor: Color = .black

    var body: some View {
        VStack {
            Spacer().frame(height: 10)
            Label("title_calculator", image: "note.text")
                .font(.custom("3x5", size: 60))
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(backgroundColor)
            
            outputView()
        }
    }
    
    func resultToShow() -> String {
        viewModel.resultToShow()
    }
}

private extension CalculatorOutputView {
    @ViewBuilder func outputView() -> some View {
        HStack {
            Spacer()
            Text(resultToShow())
                .font(.custom("3x5", size: 44))
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(foreGroundColor)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .cornerRadius(10)
                .accessibilityIdentifier("outputfield")
            Spacer()
        }
        .padding(.horizontal, 5)
    }
}

struct CalculatorOutputView_Previews: PreviewProvider {
    static var viewModel = CalculationViewModel(result: 100.20)
    static var previews: some View {
        CalculatorOutputView().environmentObject(viewModel)
    }
}
