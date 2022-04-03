//
//  TabViewController.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit

protocol TabViewControllerProtocol: UIViewController, TabPresenterOutput {
    func configure(viewControllers: [UIViewController], presenter: TabPresenterInput)
}

final class TabViewController: UITabBarController {

    private var presenter: TabPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TabViewControllerProtocol
extension TabViewController: TabViewControllerProtocol {

    func configure(viewControllers: [UIViewController], presenter: TabPresenterInput) {
        self.viewControllers = viewControllers
        self.presenter = presenter
    }
}

// MARK: - TabPresenterOutput
extension TabViewController: TabPresenterOutput {

}
