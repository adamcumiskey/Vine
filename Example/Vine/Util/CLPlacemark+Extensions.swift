//
//  CLPlacemark+Extensions.swift
//  Vine_Example
//
//  Created by Adam Cumiskey on 9/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import CoreLocation
import MapKit

extension CLPlacemark {
    var address: String {
        var addressComponents: [String] = []
        
        var streetComponents: [String] = []
        if let subThoroughfare = subThoroughfare {
            streetComponents.append(subThoroughfare)
        }
        if let thoroughfare = thoroughfare {
            streetComponents.append(thoroughfare)
        }
        addressComponents.append(streetComponents.joined(separator: " "))
        
        var localityComponents: [String] = []
        if let subLocality = subLocality {
            localityComponents.append(subLocality)
        }
        if let locality = locality {
            localityComponents.append(locality)
        }
        addressComponents.append(localityComponents.joined(separator: " "))
        
        var administrativeComponents: [String] = []
        if let subAdministrativeArea = subAdministrativeArea {
            administrativeComponents.append(subAdministrativeArea)
        }
        if let administrativeArea = administrativeArea {
            administrativeComponents.append(administrativeArea)
        }
        if let postalCode = postalCode {
            administrativeComponents.append(postalCode)
        }
        addressComponents.append(administrativeComponents.joined(separator: " "))
        
        if let country = country {
            addressComponents.append(country)
        }
        
        return addressComponents
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }
}

extension CLPlacemark: MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        guard let location = location else { return CLLocationCoordinate2D(latitude: 0, longitude: 0) }
        return location.coordinate
    }
    
    public var title: String? { return name }
    
    public var subtitle: String? { return address }
}
