//
//  MapInteractor.swift
//  Vine_Example
//
//  Created by Adam Cumiskey on 9/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift

class MapInteractor: Interactor {
    struct Input {
        var longpress: Observable<CLLocationCoordinate2D>
        var selectPlacemark: Observable<CLPlacemark>
    }
    struct Output {
        var addPlacemarks: Observable<[CLPlacemark]>
        var disposables: [Disposable]
    }
    
    static let geocoder = CLGeocoder()
    weak var vine: MapVineType?
    
    lazy var transform: Transform = { input in
        return Output(
            addPlacemarks: input.longpress
                .map { CLLocation(latitude: $0.latitude, longitude: $0.longitude) }
                .flatMap { MapInteractor.geocoder.rx.reverseGeocode(location: $0) }
                .asObservable(),
            disposables: [
                input.selectPlacemark
                    .subscribe { event in
                        if case let .next(placemark) = event {
                            self.vine?.showPlacemark(placemark)
                        }
                    }
            ]
        )
    }
}
