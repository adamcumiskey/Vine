//
//  TabVine.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import Foundation
import Vine

class MenuVine: NSObject, TabBarControllerVine {
    weak var tabBarController: TabBarControllerType?
    var embeddedInSplitView: Bool
    
    init(embeddedInSplitView: Bool) {
        self.embeddedInSplitView = embeddedInSplitView
    }
    
    func start() {
        var viewControllers = [UIViewController]()
        
        // Add the Map as a tab if we're not in a SplitView environment
        if !embeddedInSplitView {
            let mapVine = MapVine()
            let mapController = NavigationController(vine: mapVine)
            mapController.tabBarItem = UITabBarItem(title: "Map", image: nil, selectedImage: nil)
            viewControllers.append(mapController)
        }
        
        let contentVine = ContentVine()
        let contentController = NavigationController(vine: contentVine)
        contentController.tabBarItem = UITabBarItem(title: "Content", image: nil, selectedImage: nil)
        viewControllers.append(contentController)
        
        tabBarController?.viewControllers = viewControllers
    }
}

