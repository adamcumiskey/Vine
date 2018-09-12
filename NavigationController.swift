//
//  NavigationController.swift
//  Vine
//
//  Created by Adam on 9/10/18.
//

import UIKit

// The initializers for this are a little fucked up at the moment.
public class NavigationController: UINavigationController {
    public typealias VineType = Vine<NavigationController>
    var vine: VineType?

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    public init(vine: VineType, navigationBarClass: AnyClass? = nil, toolbarClass: AnyClass? = nil) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.vine = vine
        self.vine?.root = self
        self.vine?.start()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Vine where Root == NavigationController {
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        root?.pushViewController(viewController, animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        root?.present(viewController, animated: animated, completion: completion)
    }

    func popViewController(animated: Bool = true) {
        root?.popViewController(animated: animated)
    }

    func popToRootViewController(animated: Bool = true) {
        root?.popToRootViewController(animated: animated)
    }

    func popToViewController(_ viewController: UIViewController, animated: Bool = true) {
        root?.popToViewController(viewController, animated: animated)
    }
}
