//
//  RepoListViewBuilder.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import AppCore
import UseCase
import UIKit

public enum RepoListViewBuilder {
    public static func build(environment: AppEnvironment) -> UIViewController {
        let dataSource = RepoListView.DataSource()

        let presenter: RepoListPresenter & RepoListPresenterInput = RepoListPresenterImpl(
            searchRepoUseCase: SearchRepoUseCaseProvider.provide(environment: environment)
        )

        let viewController: RepoListViewControllerProtocol = RepoListViewController()
        viewController.configure(dataSource: dataSource, presenter: presenter)

        presenter.configure(output: viewController)
        return viewController
    }
}
