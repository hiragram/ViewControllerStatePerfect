//
//  GeneralStatefulContainerViewController.swift
//  ViewControllerStatePerfect
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit

func uninitialized<T>(file: StaticString = #file, line: UInt = #line) -> T { fatalError(file: file, line: line) }

public final class GeneralStatefulContainerViewController: UIViewController, StatefulContainerViewController {

    public typealias State = GeneralViewControllerState

    private lazy var noContentViewController: UIViewController = uninitialized()
    private lazy var contentViewController: UIViewController = uninitialized()
    private lazy var errorViewController: ErrorRepresentableViewController & UIViewController = uninitialized()
    private lazy var loadingViewController: UIViewController = uninitialized()

    public func get(viewControllerFor state: GeneralViewControllerState) -> UIViewController {
        switch state {
        case .contentAvailable:
            return contentViewController
        case .error:
            return errorViewController
        case .loading:
            return loadingViewController
        case .noContent:
            return noContentViewController
        }
    }

    public func setViewControllersForStates(noContent: UIViewController, contentAvailable: UIViewController, error: ErrorRepresentableViewController & UIViewController, loading: UIViewController) {
        noContentViewController = noContent
        contentViewController = contentAvailable
        errorViewController = error
        loadingViewController = loading

        addChildViewController(noContent)
        addChildViewController(contentAvailable)
        addChildViewController(error)
        addChildViewController(loading)
    }
}

public enum GeneralViewControllerState: Equatable {
    case noContent
    case contentAvailable
    case error(Error)
    case loading

    public static func ==(lhs: GeneralViewControllerState, rhs: GeneralViewControllerState) -> Bool {
        switch (lhs, rhs) {
        case (.noContent, .noContent), (.contentAvailable, .contentAvailable), (.loading, .loading):
            return true
        case (.error(let rhsError), .error(let lhsError)):
            return false // I haven't find proper way to check whether these errors are equal or not.
        default:
            return false
        }
    }
}
