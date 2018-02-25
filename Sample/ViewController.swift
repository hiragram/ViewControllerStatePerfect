//
//  ViewController.swift
//  Sample
//
//  Created by Yuya Hirayama on 2018/02/25.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit
import ViewControllerStatePerfect

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func go(_ sender: Any) {
        let detailVC = UIStoryboard.init(name: "DetailViewController", bundle: nil).instantiateInitialViewController() as! DetailViewController
        show(detailVC, sender: nil)
    }
}

