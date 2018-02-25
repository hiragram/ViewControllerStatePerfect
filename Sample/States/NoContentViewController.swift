//
//  NoContentViewController.swift
//  Sample
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit

final class NoContentViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("NoContentViewController appeared")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("NoContentViewController disappeared")
    }
}
