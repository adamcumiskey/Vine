//
//  MapVine.swift
//  Vine_Example
//
//  Created by Adam on 6/18/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import MapKit
import Vine

protocol MapVineType: class {
    func showPlacemark(placemark: CLPlacemark)
}

class MapVine: Vine<NavigationController>, MapVineType {
    func showPlacemark(placemark: CLPlacemark) {
        let controller = NavigationController(vine: .placemarkVine(placemark: placemark))
        self.root?.present(controller, animated: true, completion: nil)
    }
}
