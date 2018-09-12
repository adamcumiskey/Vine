//
//  TabBarControllerTests.swift
//  VineTests
//
//  Created by Adam on 9/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

class TabBarControllerTests: XCTestCase {
    func testTabBarControllerStartsVine() {
        let expect = expectation(description: "The TabVewController starts the vine")
        let vine = Vine<TabBarController> { _ in expect.fulfill() }
        let tabBarController = TabBarController(vine: vine)
        waitForExpectations(timeout: timeout) { _ in _ = tabBarController }
    }

    func testVineRetainsTabBarControllerRoot() {
        let vine = Vine<TabBarController> { _ in }
        let tabBarController = TabBarController(vine: vine)
        XCTAssertEqual(vine.root, tabBarController)
    }
}
