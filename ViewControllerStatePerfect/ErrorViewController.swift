//
//  ErrorViewController.swift
//  ViewControllerStatePerfect
//
//  Created by Yuya Hirayama on 2018/02/27.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit

public protocol ErrorRepresentableViewController: class where Self: UIViewController {
    func set(error: Error)

    func onRetry(block: @escaping () -> Void)
}
