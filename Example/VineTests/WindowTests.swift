//
//  WindowTests.swift
//  VineTests
//
//  Created by Adam on 9/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

class WindowTests: XCTestCase {
    func testWindowStartsVine() {
        let expect = expectation(description: "The Window starts the vine")
        let vine = Vine<Window> { _ in expect.fulfill() }
        let window = Window(frame: .zero, vine: vine)
        XCTAssertEqual(vine.root, window)
        waitForExpectations(timeout: timeout) { _ in _ = window }
    }

    func testVineRetainsWindowRoot() {
        let vine = Vine<Window> { _ in }
        let window = Window(frame: .zero, vine: vine)
        XCTAssertEqual(vine.root, window)
    }
}
