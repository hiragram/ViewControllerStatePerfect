//
//  DetailViewController.swift
//  Sample
//
//  Created by Yuya Hirayama on 2018/02/26.
//  Copyright © 2018年 Yuya Hirayama. All rights reserved.
//

import UIKit
import ViewControllerStatePerfect

final class DetailViewController: UIViewController {

    private lazy var container: GeneralStatefulContainerViewController = { fatalError() }()

    override func loadView() {
        super.loadView()

        let container = GeneralStatefulContainerViewController.init(nibName: nil, bundle: nil)

        let errorVC = UIStoryboard.init(name: "ErrorViewController", bundle: nil).instantiateInitialViewController() as! ErrorViewController
        let contentVC = UIStoryboard.init(name: "ContentViewController", bundle: nil).instantiateInitialViewController() as! ContentViewController
        let noContentVC = UIStoryboard.init(name: "NoContentViewController", bundle: nil).instantiateInitialViewController() as! NoContentViewController
        let loadingVC = UIStoryboard.init(name: "LoadingViewController", bundle: nil).instantiateInitialViewController() as! LoadingViewController

        container.setViewControllersForStates(
            noContent: noContentVC,
            contentAvailable: contentVC,
            error: errorVC,
            loading: loadingVC
        )
        container.set(state: .loading)
        
        addChildViewController(container)
        view.addSubview(container.view)
        view.addConstraints([
            view.topAnchor.constraint(equalTo: container.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: container.view.bottomAnchor),
            view.leftAnchor.constraint(equalTo: container.view.leftAnchor),
            view.rightAnchor.constraint(equalTo: container.view.rightAnchor),
            ])
        self.container = container
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        container.didMove(toParentViewController: self)
        container.set(state: .loading)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.container.set(state: .error)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DetailViewController disappeared")
    }
}
