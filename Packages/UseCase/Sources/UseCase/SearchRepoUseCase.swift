//
//  SearchRepoUseCase.swift
//  UseCase
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation

public enum SearchRepoUseCaseProvider {
    public static func provide(environment: AppEnvironment) -> SearchRepoUseCase {
        SearchRepoUseCaseImpl(
            environment: environment
        )
    }
}

public protocol SearchRepoUseCase {
    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse>
}

struct SearchRepoUseCaseImpl: SearchRepoUseCase {

    let environment: AppEnvironment

    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse> {
        return try await environment.searchRepoRepository.execute(
            searchQuery: searchQuery, page: page)
    }
}
