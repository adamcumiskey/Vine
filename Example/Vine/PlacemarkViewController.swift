//
//  PlacemarkViewController.swift
//  Vine_Example
//
//  Created by Adam on 6/18/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import MapKit
import UIKit

class PlacemarkViewController: UIViewController {
    let placemark: CLPlacemark

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLine1Label: UILabel!
    @IBOutlet weak var addressLine2Label: UILabel!

    init(placemark: CLPlacemark) {
        self.placemark = placemark
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = placemark.name
        addressLine1Label.text = placemark.locality
        addressLine2Label.text = placemark.country
    }
}
