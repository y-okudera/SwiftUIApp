//
//  SearchRepoRemoteDataSource.swift
//  Infrastructure
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation

enum SearchRepoRemoteDataSourceProvider {
    static func provide(environment: AppEnvironment) -> SearchRepoRemoteDataSource {
        SearchRepoRemoteDataSourceImpl(environment: environment)
    }
}

protocol SearchRepoRemoteDataSource {
    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse>
}

struct SearchRepoRemoteDataSourceImpl: SearchRepoRemoteDataSource {

    let environment: AppEnvironment

    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse> {
        return try await environment.apiClient.sendRequest(
            SearchRepoRequest(searchQuery: searchQuery, page: page))
    }
}
