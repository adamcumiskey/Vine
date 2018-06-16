//
//  ContentVine.swift
//  Vine_Example
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Vine

class ContentVine: NSObject, NavigationControllerVine {
    weak var navigationController: NavigationControllerType?
    
    func start() {
        let vc = ContentTableViewController(style: .plain)
        vc.title = "Content"
        navigationController?.viewControllers = [vc]
    }
}
