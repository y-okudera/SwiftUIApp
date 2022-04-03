//
//  SearchRepoRemoteDataSourceImpl.swift
//  SwiftUIApp
//
//  Created by Yuki Okudera on 2022/04/03.
//

import AppCore
import Foundation

struct SearchRepoRemoteDataSourceImpl: SearchRepoRemoteDataSource {

    let environment: AppEnvironment

    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse> {
        return try await environment.apiClient.sendRequest(
            SearchRepoRequest(searchQuery: searchQuery, page: page))
    }
}
