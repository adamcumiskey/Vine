//
//  AppDelegate.swift
//  Vine
//
//  Created by Adam on 06/16/2018.
//  Copyright (c) 2018 Adam. All rights reserved.
//

import UIKit
import Vine

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: Window?
    var vine: AppVine?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.vine = AppVine()
        self.window = Window(frame: UIScreen.main.bounds, vine: vine!)
        return true
    }
}

