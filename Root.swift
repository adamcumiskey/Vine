//
//  Root.swift
//  Pods-Vine_Example
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
