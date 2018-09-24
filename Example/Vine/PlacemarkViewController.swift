//
//  PlacemarkViewController.swift
//  Vine_Example
//
//  Created by Adam Cumiskey on 9/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CoreLocation
import Sorcery

class PlacemarkViewController: BlockTableViewController {
    init(placemark: CLPlacemark) {
        super.init(
            style: .grouped,
            dataSource: DataSource(
                items: [
                    Item { (cell: DetailCell) in
                        cell.textLabel?.text = placemark.name
                        cell.detailTextLabel?.text = "Name"
                    },
                    Item { (cell: DetailCell) in
                        cell.textLabel?.text = "(\(placemark.coordinate.latitude), \(placemark.coordinate.longitude))"
                        cell.detailTextLabel?.text = "Coordinate"
                    },
                    Item { (cell: DetailCell) in
                        cell.textLabel?.text = placemark.address
                        cell.detailTextLabel?.text = "Address"
                    }
                ]
            )
        )
    }
}
