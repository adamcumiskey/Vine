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
//  MapViewController.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import MapKit
import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx
import RxMapKit

final class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var longpress: UILongPressGestureRecognizer!
    private var interactor: MapInteractor
    init(interactor: MapInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.addGestureRecognizer(longpress)
        bind()
    }

    func bind() {
        let input = MapInteractor.Input(
            // Longpresses on the map
            longpress: longpress.rx.event
                .filter { $0.state == .began }
                .map { [unowned self] gesture in
                    let point = gesture.location(in: self.mapView)
                    let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
                    return coordinate
                }
                .asObservable(),
            // Annotation taps
            selectPlacemark: mapView.rx.didSelectAnnotationView
                .filter { return $0.annotation as? CLPlacemark != nil }
                .map { $0.annotation as! CLPlacemark }
                .asObservable()
        )
        let output = interactor.transform(input)
        
        // Disposables to hold on to
        rx.disposeBag.insert(output.disposables)
        
        // New placemarks to add to the map
        output.addPlacemarks
            .subscribe { [weak self] event in
                switch event {
                case .next(let elements):
                    self?.mapView.addAnnotations(elements)
                default: break
                }
            }
            .disposed(by: rx.disposeBag)
    }
}
