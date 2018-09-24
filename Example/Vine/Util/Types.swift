//
//  Types.swift
//  Vine_Example
//
//  Created by Adam Cumiskey on 9/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

protocol Interactor {
    associatedtype Input
    associatedtype Output
    
    typealias Transform = (Input) -> Output
    var transform: Transform { get set }
}
