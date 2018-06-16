//
//  MapVine.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import Foundation
import Vine

class MapVine: NSObject, NavigationControllerVine {
    weak var navigationController: NavigationControllerType?
    
    func start() {
        let vc = MapViewController()
        vc.title = "Map"
        navigationController?.viewControllers = [vc]
    }
}
