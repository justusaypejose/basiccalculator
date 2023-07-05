//
//  BasicCalculatorTests.swift
//  BasicCalculatorTests
//
//  Created by Justus Aype Jose on 30/06/23.
//

import XCTest
@testable import BasicCalculator

final class BasicCalculatorTests: XCTestCase {
    
    var calculationViewModel: CalculationViewModel?
    override func setUpWithError() throws {
        calculationViewModel = CalculationViewModel()
    }
    
    override func tearDownWithError() throws {
        calculationViewModel = nil
    }
    
    func testAddition() {
        guard let calculationViewModel else {
            XCTFail("View model initializing failed")
            return
        }
        calculationViewModel.updateCalculation("1")
        calculationViewModel.updateCalculation("+")
        calculationViewModel.updateCalculation("1")
        calculationViewModel.updateCalculation("=")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "2.0", "Addition Result calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("2.0")")
    }
    
    func testSubtraction() {
        guard let calculationViewModel else {
            XCTFail("View model initializing failed")
            return
        }
        calculationViewModel.updateCalculation("1")
        calculationViewModel.updateCalculation("-")
        calculationViewModel.updateCalculation("1")
        calculationViewModel.updateCalculation("=")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "0.0", "Subtraction Result calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("0.0")")
    }
    
    func testMultiplication() {
        guard let calculationViewModel else {
            XCTFail("View model initializing failed")
            return
        }
        calculationViewModel.updateCalculation("5")
        calculationViewModel.updateCalculation("*")
        calculationViewModel.updateCalculation("5")
        calculationViewModel.updateCalculation("=")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "25.0", "Multiplication Result calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("25.0")")
    }

    func testDivision() {
        guard let calculationViewModel else {
            XCTFail("View model initializing failed")
            return
        }
        calculationViewModel.updateCalculation("5")
        calculationViewModel.updateCalculation("/")
        calculationViewModel.updateCalculation("5")
        calculationViewModel.updateCalculation("=")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "1.0", "Division Result calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("1.0")")
    }
    
    func testEqualSign() {
        guard let calculationViewModel else {
            XCTFail("View model initializing failed")
            return
        }
        calculationViewModel.updateCalculation("5")
        calculationViewModel.updateCalculation("=")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "5.0", "Equal result calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("5.0")")
    }
    
    func testResetC() {
        guard let calculationViewModel else {
            XCTFail("View model initializing failed")
            return
        }
        calculationViewModel.updateCalculation("5")
        calculationViewModel.updateCalculation("=")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "5.0", "Equal result calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("5.0")")
        calculationViewModel.updateCalculation("C")
        XCTAssertEqual(calculationViewModel.calculation.resultStack, "", "Reset calculated is not correct. Got \(calculationViewModel.calculation.resultStack), expected \("")")
    }
}
