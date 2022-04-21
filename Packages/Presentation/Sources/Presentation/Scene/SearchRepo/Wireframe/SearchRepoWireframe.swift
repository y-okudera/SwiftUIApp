//
//  SearchRepoWireframe.swift
//  Presentation
//
//  Created by okudera on 2022/04/14.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit

protocol SearchRepoWireframe: AnyObject {
    var environment: AppEnvironment { get }
    func configure(viewController: UIViewController?)
    // func presentRepoList()
}

final class SearchRepoWireframeImpl: SearchRepoWireframe {

    private weak var viewController: UIViewController?
    let environment: AppEnvironment

    init(environment: AppEnvironment) {
        self.environment = environment
    }

    func configure(viewController: UIViewController?) {
        self.viewController = viewController
    }

    // func presentRepoList() {
    //     let vc = RepoListViewBuilder.build(environment: environment)
    //     viewController?.present(vc, animated: true)
    // }
}
