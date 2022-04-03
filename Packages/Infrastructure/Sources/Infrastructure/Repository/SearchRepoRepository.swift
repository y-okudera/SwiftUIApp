//
//  SearchRepoRepository.swift
//  Infrastructure
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation

public enum SearchRepoRepositoryProvider {
    public static func provide(environment: AppEnvironment) -> SearchRepoRepository {
        SearchRepoRepositoryImpl(
            searchRepoRemoteDataSource: SearchRepoRemoteDataSourceProvider.provide(
                environment: environment)
        )
    }
}

public protocol SearchRepoRepository {
    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse>
}

struct SearchRepoRepositoryImpl: SearchRepoRepository {

    let searchRepoRemoteDataSource: SearchRepoRemoteDataSource

    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse> {
        return try await searchRepoRemoteDataSource.execute(searchQuery: searchQuery, page: page)
    }
}
