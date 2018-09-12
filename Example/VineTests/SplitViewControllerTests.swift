//
//  SplitViewControllerTests.swift
//  VineTests
//
//  Created by Adam on 9/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

class SplitViewControllerTests: XCTestCase {
    func testSplitViewControllerStartsVine() {
        let expect = expectation(description: "The SplitViewController starts the vine")
        let vine = Vine<SplitViewController> { _ in expect.fulfill() }
        let splitViewController = SplitViewController(vine: vine)
        waitForExpectations(timeout: timeout) { _ in _ = splitViewController }
    }

    func testVineRetainsSplitViewControllerRoot() {
        let vine = Vine<SplitViewController> { _ in }
        let splitViewController = SplitViewController(vine: vine)
        XCTAssertEqual(vine.root, splitViewController)
    }
}
