//
//  Window.swift
//  Vine
//
//  Created by Adam on 9/10/18.
//

import UIKit

public class Window: UIWindow {
    /// Reference to the Vine
    var vine: Vine<Window>

    public init(frame: CGRect, vine: Vine<Window>) {
        self.vine = vine
        super.init(frame: frame)
        self.vine.root = self
        self.vine.start()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Vine where Root == Window {
    func setRootViewController(_ viewController: UIViewController) {
        root?.rootViewController = viewController
    }
}
