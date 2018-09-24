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
//  NavigationVines.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import MapKit
import Vine

extension Vine {
    /// Vine attached to the root window of the application
    class var app: Vine<UIWindow> {
        return Vine<UIWindow> { vine in
            // Show a split view on iPad. Otherwise, show the menu.
            if UIDevice.current.userInterfaceIdiom == .pad {
                let controller = UISplitViewController(vine: .ipad)
                vine.root?.rootViewController = controller
                vine.root?.makeKeyAndVisible()
            } else {
                let controller = UITabBarController(vine: .mainMenu(embeddedInSplitView: false))
                vine.root?.rootViewController = controller
                vine.root?.makeKeyAndVisible()
            }
        }
    }

    /// SplitView layout for iPad
    class var ipad: Vine<UISplitViewController> {
        return Vine<UISplitViewController> { vine in
            let mapController = UINavigationController(vine: .map)
            mapController.topViewController?.navigationItem.leftBarButtonItem = vine.root?.displayModeButtonItem
            let tabController = UITabBarController(vine: .mainMenu(embeddedInSplitView: true))
            vine.root?.viewControllers = [tabController, mapController]
        }
    }

    /// Main menu
    class func mainMenu(embeddedInSplitView: Bool) -> Vine<UITabBarController> {
        return Vine<UITabBarController> { vine in
            var viewControllers = [UIViewController]()
            // Add the Map as a tab if we're not in a SplitView environment
            if !embeddedInSplitView {
                let mapNavigationController = UINavigationController(vine: .map)
                mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: nil, selectedImage: nil)
                viewControllers.append(mapNavigationController)
            }
            let locationListNavigationController = UINavigationController(vine: .locationList)
            locationListNavigationController.tabBarItem = UITabBarItem(title: "Content", image: nil, selectedImage: nil)
            viewControllers.append(locationListNavigationController)
            vine.root?.viewControllers = viewControllers
        }
    }

    /// Location List
    class var locationList: Vine<UINavigationController> {
        return Vine<UINavigationController> { vine in
            let vc = UITableViewController(style: .grouped)
            vine.root?.viewControllers = [vc]
        }
    }
    
    class var map: MapVine { return MapVine() }
}
