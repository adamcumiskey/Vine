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
//  Vine.swift
//  Vine
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import UIKit

/// A Vine is an object that holds a weak reference to a Root.
///
/// This object can be used by the Root to reliquish control after initialization.
open class Vine<Root: AnyObject> {
    public typealias StartFunction = ((Vine<Root>) -> Void)

    /// The Root object that starts this Vine
    public weak var root: Root?
    private var startFunction: StartFunction?

    /// Initialize a Vine
    ///
    /// - parameters
    ///   - start: The block to call when the `start()` function is called by the `Root`
    public init(start: StartFunction? = nil) {
        self.startFunction = start
    }

    /// Start the Vine
    ///
    /// By default, this function calls the `start` block that was passed in the initializer.
    /// When subclassing this method, `super` should be called at the very beginning of this function.
    open func start() {
        startFunction?(self)
        // Set the startFunction to nil to avoid unnecessary retains
        startFunction = nil
    }
}

