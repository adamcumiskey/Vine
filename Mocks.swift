//
//  Mocks.swift
//  FBSnapshotTestCase
//
//  Created by Adam on 6/16/18.
//

import Foundation

class MockWindowVine: WindowVine {
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

class MockTabBarControllerVine: NSObject, TabBarControllerVine {
    weak var tabBarController: TabBarControllerType?
    
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
