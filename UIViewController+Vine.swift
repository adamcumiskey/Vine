//
//  ViewController.swift
//  Vine
//
//  Created by Adam on 9/10/18.
//

import UIKit

extension Vine where Root == UIViewController {
    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        root?.dismiss(animated: animated, completion: completion)
    }

    func show(_ viewController: UIViewController, sender: Any? = nil) {
        root?.show(viewController, sender: sender)
    }

    func showDetail(_ viewController: UIViewController, sender: Any? = nil) {
        root?.showDetailViewController(viewController, sender: sender)
    }
}
