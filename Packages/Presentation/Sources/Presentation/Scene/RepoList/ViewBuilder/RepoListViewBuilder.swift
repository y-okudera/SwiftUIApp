//
//  RepoListViewBuilder.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import AppCore
import UseCase

public enum RepoListViewBuilder {
    public static func build(environment: AppEnvironment) -> RepoListView {
        RepoListView(presenter: .init(searchRepoUseCase: SearchRepoUseCaseProvider.provide(environment: environment)))
    }
}
