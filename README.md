# CombineInterception

## WARNING
### If that [PR](https://github.com/CombineCommunity/CombineCocoa/pull/88) is merged, it will add functionality to CombineCocoa.
### Please use CombineCocoa in future.

## 
<p align="center">
<a href="https://github.com/apple/swift-package-manager" target="_blank"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="CombineCocoa supports Swift Package Manager (SPM)"></a>
<img src="https://img.shields.io/badge/platforms-iOS%2013.0-333333.svg" />
</p>

CombineInterception is a library that provides functionality similar to the methodInvoked function from RxCocoa, allowing you to subscribe to the invocation of Objective-C methods.

Reference from https://github.com/EduDo-Inc/CombineCocoa

## Usage
TL;DR

```swift
import UIKit
import Combine
import CombineInterception

extension UIViewController {
    var viewDidLoadPublisher: AnyPublisher<Void, Never> {
        let selector = #selector(UIViewController.viewDidLoad)
        return publisher(for: selector)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
    
    var viewWillAppearPublisher: AnyPublisher<Bool, Never> {
        let selector = #selector(UIViewController.viewWillAppear(_:))
        return intercept(selector)
            .map { $0[0] as? Bool ?? false }
            .eraseToAnyPublisher()
    }
}

class ViewController: UIViewController {
    private var subscriptions = Set<AnyCancellable>()
    
    private func bind() {
        viewDidLoadPublisher
            .sink(receiveValue: { _ in
                print("viewDidLoad")
            })
            .store(in: &subscriptions)
        
        viewWillAppearPublisher
            .sink(receiveValue: { isAnimated in
                print("viewWillAppearPublisher", isAnimated)
            })
            .store(in: &subscriptions)
    }
}
```

## Dependencies

This project has the following dependencies:

* Combine.framework

## Installation

### Swift Package Manager

Add the following dependency to your Package.swift file:

```swift
.package(url: "https://github.com/chorim/CombineInterception.git", from: "0.1.0")
```

## Acknowledgments

* CombineInterception was created by referencing https://github.com/EduDo-Inc/CombineCocoa

## License

MIT, See the [LICENSE](LICENSE) file. 

The Combine framework are property of Apple Inc.
