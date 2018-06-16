//
//  MainVine.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import Foundation
import Vine

class SplitVine: NSObject, SplitViewControllerVine {
    weak var splitViewController: SplitViewControllerType?
    
    func start() {
        let tabVine = MenuVine(embeddedInSplitView: true)
        let tabController = TabBarController(vine: tabVine)
        
        let mapVine = MapVine()
        let mapController = NavigationController(vine: mapVine)
        mapController.topViewController?.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        
        splitViewController?.viewControllers = [tabController, mapController]
    }
    
    
}
