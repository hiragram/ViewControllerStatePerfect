//
//  ContentViewController.swift
//  Sample
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit

final class ContentViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ContentViewController appeared")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ContentViewController disappeared")
    }
}
