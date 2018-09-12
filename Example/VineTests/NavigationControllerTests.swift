//
//  NavigationControllerTests.swift
//  VineTests
//
//  Created by Adam on 9/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

class NavigationControllerTests: XCTestCase {
    func testNavigationControllerStartsVine() {
        let expect = expectation(description: "The NavigationController starts the vine")
        let vine = Vine<NavigationController> { _ in expect.fulfill() }
        let navigationController = NavigationController(vine: vine)
        waitForExpectations(timeout: timeout) { _ in _ = navigationController }
    }

    func testVineRetainsNavigationControllerRoot() {
        let vine = Vine<NavigationController> { _ in }
        let navigationController = NavigationController(vine: vine)
        XCTAssertEqual(vine.root, navigationController)
    }
}
