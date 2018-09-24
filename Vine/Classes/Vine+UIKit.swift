//  Copyright (c) 2018 Adam <adam.cumiskey@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Vine+UIKit.swift
//  Vine
//
//  Created by Adam Cumiskey on 9/22/18.
//

import UIKit

extension UIWindow: Root {
    /// Initialize a UIWindow with an attached Vine
    public convenience init(vine: VineType, frame: CGRect = .zero) {
        self.init(frame: frame)
        self.vine = vine
    }
}

extension UINavigationController: Root {
    /// Initialize a UINavigationController with an attached Vine
    public convenience init(vine: VineType, nibName: String? = nil, bundle: Bundle? = nil) {
        self.init(nibName: nibName, bundle: bundle)
        self.vine = vine
    }
    
    /// Initialize a UINavigationController with an attached Vine
    public convenience init(vine: VineType, navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.vine = vine
    }
}

extension UISplitViewController: Root {
    /// Initialize a UISplitViewController with an attached Vine
    public convenience init(vine: VineType, nibName: String? = nil, bundle: Bundle? = nil) {
        self.init(nibName: nibName, bundle: bundle)
        self.vine = vine
    }
}

extension UITabBarController: Root {
    /// Initialize a UITabBarController with an attached Vine
    public convenience init(vine: VineType, nibName: String? = nil, bundle: Bundle? = nil) {
        self.init(nibName: nibName, bundle: bundle)
        self.vine = vine
    }
}
