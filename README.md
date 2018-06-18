# Vine

[![CI Status](https://img.shields.io/travis/Adam/Vine.svg?style=flat)](https://travis-ci.org/Adam/Vine)
[![Version](https://img.shields.io/cocoapods/v/Vine.svg?style=flat)](https://cocoapods.org/pods/Vine)
[![License](https://img.shields.io/cocoapods/l/Vine.svg?style=flat)](https://cocoapods.org/pods/Vine)
[![Platform](https://img.shields.io/cocoapods/p/Vine.svg?style=flat)](https://cocoapods.org/pods/Vine)

## Introduction

**Vine** is a library for managing navigation in iOS Applications based on the Coordinator pattern.
In the **Vine** model, the UIKit components hold strong references to the Vines while the Vines have weak references
back to their parent. This makes memory management of Vines automatic.

## Vines

The Vine protocol defines just one function, `start()`. This is used to setup and configure the root
UIKit component and is called immediately after that component initializes.
Each of the specialized Vine protocols adds a reference to the root component.
In your implementation this **MUST** be stored as a weak reference otherwise a retain cycle will occur.
Each type is defined using a protocol in order to support unit testing.

Vines are specialized to work with specific UIKit Components.
  - `WindowVine` can be used with the `Window` subclass of `UIWindow`
  - `NavigationControllerVine` can be used with the `NavigationController` subclass of `UINavigationController`
  - `SplitViewControllerVine` can be used with the `SplitViewController` subclass of `UISplitViewController`
  - `TabBarControllerVine` can be used with the `TabBarController` subclass of `UITabBarController`

```swift
// MenuVine.swift

class MenuVine: NSObject, NavigationVine {
  weak var navigationController: NavigationControllerType?

  func start() {
    let initialVC = ViewController()
    navigationController?.viewControllers = [initialVC]
  }
}

// RootVine.swift

class RootVine: WindowVine {
  weak var window: WindowType?

  func start() {
    let menuVine = MenuVine()
    let menuController = NavigationController(vine: menuVine)
    window?.rootViewController = menuController
  }
}
```

// Structure of an app built with Vines
![Vine Example](images/vine_example.png)

## Motivation

Removing navigation logic from view controllers is a good way to separate concerns and increase testability.
The [Coordinator](http://khanlou.com/2015/10/coordinators-redux/) pattern has been written about extensively,
and is widely accepted. However I believe this pattern causes significant memory management overhead and makes
it dangerous to use UIKit navigation methods directly.

Coordinators store a reference to a root UIKit object and an array of child coordinators. When adding a new view controller
with a child coordinator, the parent must hold a strong reference to the child to prevent it from getting deallocated.
When the child view controller is removed, the child coordinator reference also needs to be removed from the parent.
But what happens when a someone doesn't feel like delegating a dismiss command through 4 layers of coordinators and
just calls `dismiss(animated:completion:)` from a random view controller? If that view controller is managed by a coordinator, the coordinator won't
get removed until its parent is removed. If that coordinator is strongly retaining view controllers (quite common from what I've seen)
they will also stay stuck in memory even though they are no longer on screen.

For example, a coordinator managing a UINavigationController stack receives a message to present a modal.
![Uncoordinated 1](images/uncoordinated_1.png)
The coordinator creates the modal view controller along with a coordinator to manage it.
The view controller is presented from the topViewController and the child coordinator is attached to the parent.
![Uncoordinated 2](images/uncoordinated_2.png)
The modal view controller calls `dismiss(animated:completion:)` without telling the parent Coordinator
![Uncoordinated 3](images/uncoordinated_3.png)
The modal view controller is dismissed, but the Child Coordinator still holds a reference to it.
![Uncoordinated 4](images/uncoordinated_4.png)
Now both the Child Coordinator and the view controllers it references are stuck in memory until the parent deallocates.

**Vine** takes the opinion that it's better to rely on the navigation hierarchy to drive memory management.
Not only does this reduce implementation overhead, it also makes it easy to integrate Vine into existing projects.
Creating and presenting a Vine powered view controller is the same process as presenting a normal view controller, and
any part of your app can dismiss it without knowing out how to tear it down.

## Installation

**Vine** is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Vine'
```

## Author

Adam Cumiskey, adam.cumiskey@gmail.com

## License
**Vine** is available under the MIT license. See the LICENSE file for more info.
