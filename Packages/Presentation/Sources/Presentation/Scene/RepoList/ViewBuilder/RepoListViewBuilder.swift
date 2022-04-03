//
//  RepoListViewBuilder.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import AppCore
import UIKit
import UseCase

enum RepoListViewBuilder {
    static func build(environment: AppEnvironment) -> UIViewController {
        let wireFrame = RepoListWireframeImpl(environment: environment)
        let presenter: RepoListPresenter & RepoListPresenterInput = RepoListPresenterImpl(
            searchRepoUseCase: SearchRepoUseCaseProvider.provide(environment: environment),
            wireframe: wireFrame
        )

        let viewController: RepoListViewControllerProtocol = RepoListViewController()
        let dataSource = RepoListView.DataSource()
        viewController.configure(dataSource: dataSource, presenter: presenter)

        presenter.configure(output: viewController)
        wireFrame.configure(viewController: viewController)

        return viewController
    }
}
