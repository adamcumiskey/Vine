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

