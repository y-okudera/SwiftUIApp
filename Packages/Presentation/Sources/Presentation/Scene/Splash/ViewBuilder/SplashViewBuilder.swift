//
//  SplashViewBuilder.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit
import UseCase

public enum SplashViewBuilder {
    public static func build(environment: AppEnvironment) -> UIViewController {
        let wireFrame = SplashWireframeImpl(environment: environment)
        let presenter: SplashPresenter & SplashPresenterInput = SplashPresenterImpl(
            wireframe: wireFrame
        )

        let viewController: SplashViewControllerProtocol = SplashViewController()
        let dataSource = SplashView.DataSource()
        viewController.configure(dataSource: dataSource, presenter: presenter)

        presenter.configure(output: viewController)
        wireFrame.configure(viewController: viewController)

        return viewController
    }
}
