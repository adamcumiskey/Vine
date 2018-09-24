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
//  MapVine.swift
//  VineExample
//
//  Created by Adam on 6/18/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import MapKit
import Vine

protocol MapVineType: class {
    func showPlacemark(_ placemark: CLPlacemark)
}

class MapVine: Vine<UINavigationController>, MapVineType {
    override func start() {
        let interactor = MapInteractor()
        interactor.vine = self
        let vc = MapViewController(interactor: interactor)
        vc.title = "Map"
        root?.viewControllers = [vc]
    }
    
    func showPlacemark(_ placemark: CLPlacemark) {
        let vc = PlacemarkViewController(placemark: placemark)
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissModal))
        let nav = UINavigationController(rootViewController: vc)
        root?.present(nav, animated: true, completion: nil)
    }
    
    @objc func dismissModal() {
        root?.dismiss(animated: true, completion: nil)
    }
}
