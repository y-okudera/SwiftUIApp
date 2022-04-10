//
//  SearchUserViewBuilder.swift
//  Presentation
//
//  Created by yuoku on 2022/04/10.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit
import UseCase

enum SearchUserViewBuilder {
    static func build(environment: AppEnvironment) -> UIViewController {
        let wireFrame = SearchUserWireframeImpl(environment: environment)
        let presenter: SearchUserPresenter & SearchUserPresenterInput = SearchUserPresenterImpl(
            searchRepoUseCase: SearchRepoUseCaseProvider.provide(environment: environment),
            wireframe: wireFrame
        )

        let viewController: SearchUserViewControllerProtocol = SearchUserViewController()
        let dataSource = SearchUserView.DataSource()
        viewController.configure(dataSource: dataSource, presenter: presenter)

        presenter.configure(output: viewController)
        wireFrame.configure(viewController: viewController)

        return viewController
    }
}
