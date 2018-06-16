//
//  Mocks.swift
//  VineTests
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Vine

class MockWindowVine: NSObject, WindowVine {
    weak var window: WindowType?
    
    var didStart = false
    func start() {
        didStart = true
    }
}

class MockNavigationControllerVine: NSObject, NavigationControllerVine {
    weak var navigationController: NavigationControllerType?
    
    var didStart = false
    func start() {
        didStart = true
    }
}

class MockSplitViewControllerVine: NSObject, SplitViewControllerVine {
    weak var splitViewController: SplitViewControllerType?
    
    var didStart = false
    func start() {
        didStart = true
    }
}

class MockTabBarControllerVine: NSObject, TabBarControllerVine {
    weak var tabBarController: TabBarControllerType?
    
    var didStart = false
    func start() {
        didStart = true
    }
}
