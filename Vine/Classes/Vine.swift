//
//  Vine.swift
//  Vine
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import UIKit

/**
 A Vine grows your application.
 */
public protocol Vine: class {
    /// Bootstrap initial view controller(s) to parent UIKit object
    func start()
}

// MARK: - Window

public protocol WindowType: class {
    func makeKeyAndVisible()
    var rootViewController: UIViewController? { get set }
    
    func snapshotView(afterScreenUpdates: Bool) -> UIView?
    func resizableSnapshotView(from: CGRect, afterScreenUpdates: Bool, withCapInsets: UIEdgeInsets) -> UIView?
    func drawHierarchy(in: CGRect, afterScreenUpdates: Bool) -> Bool
}

public protocol WindowVine: Vine {
    /// Reference to the window. Must be `weak` to avoid retain cycle.
    var window: WindowType? { get set }
}

public class Window: UIWindow, WindowType {
    /// Reference to the Vine
    var vine: WindowVine
    
    public init(frame: CGRect, vine: WindowVine) {
        self.vine = vine
        super.init(frame: frame)
        self.vine.window = self
        self.vine.start()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - NavigationController

public protocol NavigationControllerType: class {
    func pushViewController(_ vc: UIViewController, animated: Bool)
    func popViewController(animated: Bool) -> UIViewController?
    func popToRootViewController(animated: Bool) -> [UIViewController]?
    
    var topViewController: UIViewController? { get }
    var visibleViewController: UIViewController? { get }
    var viewControllers: [UIViewController] { get set }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool)
    
    var isNavigationBarHidden: Bool { get set }
    func setNavigationBarHidden(_ hidden: Bool, animated: Bool)
    var navigationBar: UINavigationBar { get }
    
    var isToolbarHidden: Bool { get set }
    func setToolbarHidden(_ hidden: Bool, animated: Bool)
    var toolbar: UIToolbar! { get }
    
    func show(_ vc: UIViewController, sender: Any?)
    
    var hidesBarsWhenKeyboardAppears: Bool { get set }
    var hidesBarsOnSwipe: Bool { get set }
    var hidesBarsWhenVerticallyCompact: Bool { get set }
    var hidesBarsOnTap: Bool { get set }
}

public protocol NavigationControllerVine: Vine, UINavigationControllerDelegate {
    var navigationController: NavigationControllerType? { get set }
}

public class NavigationController: UINavigationController, NavigationControllerType {
    var vine: NavigationControllerVine?
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public init(navigationBarClass: AnyClass? = nil, toolbarClass: AnyClass? = nil, vine: NavigationControllerVine) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.vine = vine
        
        delegate = vine
        vine.navigationController = self
        vine.start()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SplitViewController

public protocol SplitViewControllerType: class {
    var viewControllers: [UIViewController] { get set }
    var presentsWithGesture: Bool { get set }
    var isCollapsed: Bool { get }
    var preferredDisplayMode: UISplitViewControllerDisplayMode { get set }
    var displayMode: UISplitViewControllerDisplayMode { get }
    var displayModeButtonItem: UIBarButtonItem { get }
    var preferredPrimaryColumnWidthFraction: CGFloat { get set }
    var minimumPrimaryColumnWidth: CGFloat { get set }
    var maximumPrimaryColumnWidth: CGFloat { get set }
    var primaryColumnWidth: CGFloat { get }
    
    func show(_ vc: UIViewController, sender: Any?)
    func showDetailViewController(_ vc: UIViewController, sender: Any?)
}

public protocol SplitViewControllerVine: Vine, UISplitViewControllerDelegate {
    var splitViewController: SplitViewControllerType? { get set }
}

public class SplitViewController: UISplitViewController, SplitViewControllerType {
    var vine: SplitViewControllerVine
    
    public init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil, vine: SplitViewControllerVine) {
        self.vine = vine
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        delegate = vine
        vine.splitViewController = self
        vine.start()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TabBarController

public protocol TabBarControllerType: class {
    var viewControllers: [UIViewController]? { get set }
    func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool)
    
    var selectedViewController: UIViewController? { get set }
    var selectedIndex: Int { get set }
    var customizableViewControllers: [UIViewController]? { get set }
    
    var tabBar: UITabBar { get }
}

public protocol TabBarControllerVine: Vine, UITabBarControllerDelegate {
    var tabBarController: TabBarControllerType? { get set }
}

public class TabBarController: UITabBarController, TabBarControllerType {
    var vine: TabBarControllerVine
    
    public init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil, vine: TabBarControllerVine) {
        self.vine = vine
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        delegate = vine
        vine.tabBarController = self
        vine.start()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
