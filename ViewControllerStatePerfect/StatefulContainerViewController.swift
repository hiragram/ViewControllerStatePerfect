//
//  StatefulContainerViewController.swift
//  ViewControllerStatePerfect
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit

public protocol StatefulContainerViewController: class where Self: UIViewController {
    associatedtype State

    func set(state: State)

    func get(viewControllerFor: State) -> UIViewController
}

public extension StatefulContainerViewController {
    func set(state: State) {
        view.subviews.forEach { $0.removeFromSuperview() }

        let vc = get(viewControllerFor: state)
        view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)

        vc.view.topAnchor.constraint(equalTo: view.topAnchor)
        vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        vc.view.leftAnchor.constraint(equalTo: view.leftAnchor)
        vc.view.rightAnchor.constraint(equalTo: view.rightAnchor)
    }
}
