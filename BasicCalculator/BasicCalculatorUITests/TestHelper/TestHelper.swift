//
//  TestHelper.swift
//  BasicCalculatorUITests
//
//  Created by Justus Aype Jose on 05/07/23.
//

import Foundation
import XCTest

protocol TestHelper {
    func screenshot(_ name: String) -> XCTAttachment
}

extension TestHelper {
    func screenshot(_ name: String) -> XCTAttachment {
        let attachment = XCTAttachment(screenshot: XCUIApplication().screenshot())
        attachment.name = name
        attachment.lifetime = XCTAttachment.Lifetime.keepAlways
        return (attachment)
    }
}
