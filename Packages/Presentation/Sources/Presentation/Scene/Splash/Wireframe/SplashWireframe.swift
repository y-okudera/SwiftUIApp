//
//  SplashWireframe.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit

protocol SplashWireframe: AnyObject {
    var environment: AppEnvironment { get }
    func configure(viewController: UIViewController?)
    func presentRepoList()
}

final class SplashWireframeImpl: SplashWireframe {

    private weak var viewController: UIViewController?
    let environment: AppEnvironment

    init(environment: AppEnvironment) {
        self.environment = environment
    }

    func configure(viewController: UIViewController?) {
        self.viewController = viewController
    }

    func presentRepoList() {
        let vc = RepoListViewBuilder.build(environment: environment)
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
    }
}
