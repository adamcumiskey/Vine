//
//  CLGeocoder+Rx.swift
//  Vine_Example
//
//  Created by Adam Cumiskey on 9/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift

extension Reactive where Base: CLGeocoder {
    func reverseGeocode(location: CLLocation) -> Observable<[CLPlacemark]> {
        return Observable.create { observer in
            self.base.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    observer.onError(error)
                } else if let placemarks = placemarks {
                    observer.onNext(placemarks)
                    observer.onCompleted()
                } else {
                    observer.onError(RxError.unknown)
                }
            }
            return Disposables.create {
                self.base.cancelGeocode()
            }
        }
    }
}
