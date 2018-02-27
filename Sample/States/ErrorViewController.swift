//
//  ErrorViewController.swift
//  Sample
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit
import ViewControllerStatePerfect

final class ErrorViewController: UIViewController, ErrorRepresentableViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ErrorViewController appeared")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ErrorViewController disappeared")
    }

    func set(error: Error) {

    }

    func onRetry(block: @escaping () -> Void) {

    }
}
