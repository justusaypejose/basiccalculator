//
//  CalculatorView.swift
//  BasicCalculator
//
//  Created by Justus Aype Jose on 30/06/23.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var viewModel: CalculationViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CalculatorOutputView()
            CalculatorKeypadView()
            Spacer()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
