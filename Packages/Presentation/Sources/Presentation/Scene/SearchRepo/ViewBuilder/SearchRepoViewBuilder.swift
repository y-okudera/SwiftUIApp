//
//  SearchRepoViewBuilder.swift
//  Presentation
//
//  Created by okudera on 2022/04/14.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit
import UseCase

enum SearchRepoViewBuilder {
    static func build(environment: AppEnvironment) -> UIViewController {
        let wireFrame = SearchRepoWireframeImpl(environment: environment)
        let presenter: SearchRepoPresenter & SearchRepoPresenterInput = SearchRepoPresenterImpl(
            searchRepoUseCase: SearchRepoUseCaseProvider.provide(environment: environment),
            wireframe: wireFrame
        )

        let viewController: SearchRepoViewControllerProtocol = SearchRepoViewController()
        let dataSource = SearchRepoView.DataSource.mock
        viewController.configure(dataSource: dataSource, presenter: presenter)

        presenter.configure(output: viewController)
        wireFrame.configure(viewController: viewController)

        return viewController
    }
}
