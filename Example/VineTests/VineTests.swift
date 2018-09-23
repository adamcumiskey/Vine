//  Copyright (c) 2018 Adam <adam.cumiskey@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  VineTests.swift
//  VineTests
//
//  Created by Adam Cumiskey on 9/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Vine

let timeout = 0.1

extension NSObject: Root {}

class VineTests: XCTestCase {
    func testVineShouldHaveReferenceToRootAfterBeingAssignedToRoot() {
        let vine = Vine<NSObject>()
        let object = NSObject()
        object.attachVine(vine)
        XCTAssertEqual(vine.root, object)
    }
    
    func testVineShouldStartAfterBeingAssignedToRoot() {
        let expect = expectation(description: "starts the vine")
        let vine = Vine<NSObject> { _ in expect.fulfill() }
        let object = NSObject()
        object.attachVine(vine)
        waitForExpectations(timeout: timeout) { _ in }
    }
}
