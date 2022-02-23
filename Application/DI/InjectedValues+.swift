//
//  InjectedValues+.swift
//  Application
//
//  Created by okudera on 2022/02/24.
//

import Domain
import Infrastructure
import Injected

// MARK: - RepoRepositoryProviding
private struct RepoRepositoryProviderKey: InjectionKey {
    static var currentValue: RepoRepositoryProviding = RepoRepository()
}

extension InjectedValues {
    var repoRepositoryProvider: RepoRepositoryProviding {
        get { Self[RepoRepositoryProviderKey.self] }
        set { Self[RepoRepositoryProviderKey.self] = newValue }
    }
}

// MARK: - UserRepositoryProviding
private struct UserRepositoryProviderKey: InjectionKey {
    static var currentValue: UserRepositoryProviding = UserRepository()
}

extension InjectedValues {
    var userRepositoryProvider: UserRepositoryProviding {
        get { Self[UserRepositoryProviderKey.self] }
        set { Self[UserRepositoryProviderKey.self] = newValue }
    }
}
