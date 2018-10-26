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
//  Root.swift
//  Vine
//
//  Created by Adam Cumiskey on 9/22/18.
//

import Foundation

private enum AssociatedKeys {
    static var vine: String = "vine_root_associated_key"
}

/// Objects conforming to this protocol gain a `vine` property which can be used to attach and start a Vine.
public protocol Root: AnyObject {
    associatedtype VineType = Vine<Self>
}

public extension Root {
    /// The Vine attached to this Root
    ///
    /// By setting this property, a strong reference is made to the vine, `vine.root` is set to `self`, and then `vine.start()` is called.
    /// It is recommended that you only set this property once.
    var vine: VineType? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.vine) as? VineType
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.vine, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let vine = vine as? Vine<Self> { // this will always be true
                vine.root = self
                vine.start()
            }
        }
    }
}
