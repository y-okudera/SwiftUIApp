//
//  RepoListWireframe.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/04/03.
//

import AppCore
import UIKit

public protocol RepoListWireframe: AnyObject {
    var environment: AppEnvironment { get }
    func configure(viewController: UIViewController?)
    func presentRepoList()
}

public final class RepoListWireframeImpl: RepoListWireframe {

    private weak var viewController: UIViewController?
    public let environment: AppEnvironment

    public init(environment: AppEnvironment) {
        self.environment = environment
    }

    public func configure(viewController: UIViewController?) {
        self.viewController = viewController
    }

    public func presentRepoList() {
        let vc = RepoListViewBuilder.build(environment: environment)
        viewController?.present(vc, animated: true)
    }
}
