//
//  InjectedValues+.swift
//  Presentation
//
//  Created by okudera on 2022/02/24.
//

import Application
import Injected

// MARK: - RepoListActionCreatorProviderKey
private struct RepoListActionCreatorProviderKey: InjectionKey {
    static var currentValue: RepoListActionCreatorProviding = RepoListActionCreator()
}

extension InjectedValues {
    var repoListActionCreatorProvider: RepoListActionCreatorProviding {
        get { Self[RepoListActionCreatorProviderKey.self] }
        set { Self[RepoListActionCreatorProviderKey.self] = newValue }
    }
}
