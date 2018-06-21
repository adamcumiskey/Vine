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
//  AppVine.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import MapKit
import Vine

extension Vine {
    /// Vine attached to the root window of the application
    class var appVine: Vine<Window> {
        return Vine<Window> { vine in
            if UIDevice.current.userInterfaceIdiom == .pad {
                let controller = SplitViewController(vine: .ipadVine)
                vine.root?.rootViewController = controller
                vine.root?.makeKeyAndVisible()
            } else {
                let controller = TabBarController(vine: .menuVine(embeddedInSplitView: false))
                vine.root?.rootViewController = controller
                vine.root?.makeKeyAndVisible()
            }
        }
    }

    /// SplitView layout for iPad
    class var ipadVine: Vine<SplitViewController> {
        return Vine<SplitViewController> { vine in
            let mapController = NavigationController(vine: .mapVine)
            mapController.topViewController?.navigationItem.leftBarButtonItem = vine.root?.displayModeButtonItem
            let tabController = TabBarController(vine: .menuVine(embeddedInSplitView: true))
            vine.root?.viewControllers = [tabController, mapController]
        }
    }

    /// Main tab menu
    class func menuVine(embeddedInSplitView: Bool) -> Vine<TabBarController> {
        return Vine<TabBarController> { vine in
            var viewControllers = [UIViewController]()
            // Add the Map as a tab if we're not in a SplitView environment
            if !embeddedInSplitView {
                let mapController = NavigationController(vine: .mapVine)
                mapController.tabBarItem = UITabBarItem(title: "Map", image: nil, selectedImage: nil)
                viewControllers.append(mapController)
            }
            let contentController = NavigationController(vine: .contentVine)
            contentController.tabBarItem = UITabBarItem(title: "Content", image: nil, selectedImage: nil)
            viewControllers.append(contentController)
            vine.root?.viewControllers = viewControllers
        }
    }

    /// List in navigation controller
    class var contentVine: Vine<NavigationController> {
        return Vine<NavigationController> { vine in
            let vc = LocationListViewController(style: .plain)
            vc.title = "Locations"
            vine.root?.viewControllers = [vc]
        }
    }

    /// Map in navigation controller
    class var mapVine: MapVine {
        return MapVine { vine in
            let vc = MapViewController(nibName: nil, bundle: nil)
            vc.title = "Map"
            vine.root?.viewControllers = [vc]
        }
    }

    class func placemarkVine(placemark: CLPlacemark) -> Vine<NavigationController> {
        return Vine<NavigationController> { vine in
            let controller = PlacemarkViewController(placemark: placemark)
            vine.root?.viewControllers = [controller]
        }
    }
}
