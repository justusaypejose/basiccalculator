//
//  BasicCalculatorUITests.swift
//  BasicCalculatorUITests
//
//  Created by Justus Aype Jose on 30/06/23.
//

import XCTest

final class BasicCalculatorUITests: XCTestCase, TestHelper {

    var app: XCUIApplication?
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testOutputNotNilEmptyState() throws {
        // UI tests must launch the application that they test.
        guard let app else {
            XCTFail("App initializing failed")
            return
        }
        app.launch()
        XCTAssertNotNil(app.staticTexts["outputfield"].label, "Output field is not nil")
    }

    func testOutputAfterAddition() throws {
        guard let app else {
            XCTFail("App initializing failed")
            return
        }
        app.launch()
        app.buttons["Button_1"].tap()
        app.buttons["Button_+"].tap()
        app.buttons["Button_2"].tap()
        app.buttons["Button_="].tap()
        add(self.screenshot("testOutputAfterAddition"))
        XCTAssertTrue(app.staticTexts["outputfield"].label == "3.0", "Output field is not correct. Got \(app.staticTexts["outputfield"].label), expected \("3.0")")
    }
    
    func testOutputAfterSubtraction() throws {
        guard let app else {
            XCTFail("App initializing failed")
            return
        }
        app.launch()
        app.buttons["Button_9"].tap()
        app.buttons["Button_-"].tap()
        app.buttons["Button_2"].tap()
        app.buttons["Button_="].tap()
        add(self.screenshot("testOutputAfterSubtraction"))
        XCTAssertTrue(app.staticTexts["outputfield"].label == "7.0", "Output field is not correct. Got \(app.staticTexts["outputfield"].label), expected \("7.0")")
    }
    
    func testOutputAfterDivision() throws {
        guard let app else {
            XCTFail("App initializing failed")
            return
        }
        app.launch()
        app.buttons["Button_9"].tap()
        app.buttons["Button_/"].tap()
        app.buttons["Button_3"].tap()
        app.buttons["Button_="].tap()
        add(self.screenshot("testOutputAfterDivision"))
        XCTAssertTrue(app.staticTexts["outputfield"].label == "3.0", "Output field is not correct. Got \(app.staticTexts["outputfield"].label), expected \("3.0")")
    }
    
    
    func testOutputAfterMultiplication() throws {
        guard let app else {
            XCTFail("App initializing failed")
            return
        }
        app.launch()
        app.buttons["Button_9"].tap()
        app.buttons["Button_*"].tap()
        app.buttons["Button_3"].tap()
        app.buttons["Button_="].tap()
        add(self.screenshot("testOutputAfterMultiplication"))
        XCTAssertTrue(app.staticTexts["outputfield"].label == "27.0", "Output field is not correct. Got \(app.staticTexts["outputfield"].label), expected \("27.0")")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
