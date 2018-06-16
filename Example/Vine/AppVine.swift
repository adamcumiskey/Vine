//
//  AppVine.swift
//  VineExample
//
//  Created by Adam on 6/16/18.
//  Copyright © 2018 Adam Cumiskey. All rights reserved.
//

import UIKit
import Vine

class AppVine: WindowVine {
    weak var window: WindowType?
    
    func start() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let vine = SplitVine()
            let controller = SplitViewController(vine: vine)
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        } else {
            let vine = MenuVine(embeddedInSplitView: false)
            let controller = TabBarController(vine: vine)
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        }
    }
}
