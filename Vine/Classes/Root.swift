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

/// A Root is an object that strongly retains a Vine
public protocol Root: AnyObject {
    associatedtype T = AnyObject
    var vine: Vine<T>? { get set }
}

public extension Root where T == Self {
    /// The Vine for this Root.
    ///
    /// Setting this value will assign `vine.root` to `self` and call `vine.start()`.
    var vine: Vine<T>? {
        get {
            guard let vine = objc_getAssociatedObject(self, &AssociatedKeys.vine) as? Vine<T> else { return nil }
            return vine
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.vine, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let vine = newValue {
                vine.root = self
                vine.start()
            }
        }
    }
}
