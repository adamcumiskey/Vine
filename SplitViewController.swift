//
//  SplitViewController.swift
//  Vine
//
//  Created by Adam on 9/10/18.
//

import UIKit

public class SplitViewController: UISplitViewController {
    public typealias VineType = Vine<SplitViewController>
    var vine: VineType

    public init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil, vine: VineType) {
        self.vine = vine
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.vine.root = self
        self.vine.start()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
