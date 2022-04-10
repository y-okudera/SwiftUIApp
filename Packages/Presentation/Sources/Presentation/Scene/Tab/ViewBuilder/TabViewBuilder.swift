//
//  TabViewBuilder.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit
import UseCase

enum TabViewBuilder {
    static func build(environment: AppEnvironment) -> UIViewController {
        let wireFrame = TabWireframeImpl(environment: environment)
        let presenter: TabPresenter & TabPresenterInput = TabPresenterImpl(
            wireframe: wireFrame
        )

        let viewController: TabViewControllerProtocol = TabViewController()
        viewController.configure(viewControllers: self.viewControllers(environment: environment), presenter: presenter)

        presenter.configure(output: viewController)
        wireFrame.configure(viewController: viewController)

        return viewController
    }

    private static func viewControllers(environment: AppEnvironment) -> [UIViewController] {
        let repoListVC = RepoListViewBuilder.build(environment: environment)
        repoListVC.tabBarItem = .init(title: "Repo", image: UIImage(systemName: "magnifyingglass"), tag: 0)

        let searchUserVC = SearchUserViewBuilder.build(environment: environment)
        searchUserVC.tabBarItem = .init(title: "User", image: UIImage(systemName: "person"), tag: 1)

        // TODO: - Will replace another viewcontroller.

        let repoListVC3 = RepoListViewBuilder.build(environment: environment)
        repoListVC3.tabBarItem = .init(title: "Repo", image: UIImage(systemName: "magnifyingglass"), tag: 2)

        return [
            repoListVC,
            searchUserVC,
            repoListVC3,
        ]
    }
}
