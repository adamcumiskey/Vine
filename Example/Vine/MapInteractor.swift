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

struct MapInteractor: Interactor {
    struct Input {
        var longpress: Observable<CLLocationCoordinate2D>
    }
    struct Output {
        var addPlacemarks: Observable<[CLPlacemark]>
    }
    
    static let geocoder = CLGeocoder()
    
    var transform: Transform = { input in
        return Output(
            addPlacemarks: input.longpress
                .map { CLLocation(latitude: $0.latitude, longitude: $0.longitude) }
                .flatMap { MapInteractor.geocoder.rx.reverseGeocode(location: $0) }
                .asObservable()
        )
    }
}
