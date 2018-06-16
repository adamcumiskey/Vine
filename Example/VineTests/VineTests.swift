//
//  VineTests.swift
//  VineTests
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

class VineTests: XCTestCase {
    
    func testWindowInitialization() {
        let vine = MockWindowVine()
        let window = Window(frame: .zero, vine: vine)
        XCTAssertTrue(vine.didStart)
        XCTAssertTrue(window.vine === vine)
        XCTAssertTrue(vine.window === window)
    }
    
    func testNavigationControllerInitilization() {
        let vine = MockNavigationControllerVine()
        let navigationController = NavigationController(vine: vine)
        XCTAssertTrue(vine.didStart)
        XCTAssertTrue(navigationController.vine === vine)
        XCTAssertTrue(navigationController.delegate === vine)
        XCTAssertTrue(vine.navigationController === navigationController)
    }
    
    func testSplitViewControllerInitialization() {
        let vine = MockSplitViewControllerVine()
        let splitViewController = SplitViewController(vine: vine)
        XCTAssertTrue(vine.didStart)
        XCTAssertTrue(splitViewController.vine === vine)
        XCTAssertTrue(splitViewController.delegate === vine)
        XCTAssertTrue(vine.splitViewController === splitViewController)
    }
    
    func testTabBarControllerInitialization() {
        let vine = MockTabBarControllerVine()
        let tabBarController = TabBarController(vine: vine)
        XCTAssertTrue(vine.didStart)
        XCTAssertTrue(tabBarController.vine === vine)
        XCTAssertTrue(tabBarController.delegate === vine)
        XCTAssertTrue(vine.tabBarController === tabBarController)
    }
    
}
