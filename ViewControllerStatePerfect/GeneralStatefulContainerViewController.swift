//
//  GeneralStatefulContainerViewController.swift
//  ViewControllerStatePerfect
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit

func uninitialized<T>(file: String = #file, line: Int = #line) -> T { fatalError(file: file, line: line) }

public final class GeneralStatefulContainerViewController: UIViewController, StatefulContainerViewController {

    public typealias State = GeneralViewControllerState

    private lazy var noContentViewController: UIViewController = uninitialized()
    private lazy var contentViewController: UIViewController = uninitialized()
    private lazy var errorViewController: UIViewController = uninitialized()
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

    public func setViewControllersForStates(noContent: UIViewController, contentAvailable: UIViewController, error: UIViewController, loading: UIViewController) {
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

public enum GeneralViewControllerState {
    case noContent
    case contentAvailable
    case error
    case loading
}
