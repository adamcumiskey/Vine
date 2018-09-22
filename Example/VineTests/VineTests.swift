//
//  VineTests.swift
//  VineTests
//
//  Created by Adam Cumiskey on 9/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

extension NSObject: Root {}

class VineTests: XCTestCase {
    func testVineShouldHaveReferenceToRootAfterBeingAssignedToRoot() {
        let vine = Vine<NSObject>()
        let object = NSObject()
        object.vine = vine
        XCTAssertEqual(vine.root, object)
    }
    
    func testVineShouldStartAfterBeingAssignedToRoot() {
        let expect = expectation(description: "starts the vine")
        let vine = Vine<NSObject> { vine in
            expect.fulfill()
        }
        let object = NSObject()
        object.vine = vine
        waitForExpectations(timeout: timeout) { _ in }
    }
}
