//
//  SearchRepoRepositoryImpl.swift
//  SwiftUIApp
//
//  Created by Yuki Okudera on 2022/04/03.
//

import AppCore
import Foundation

struct SearchRepoRepositoryImpl: SearchRepoRepository {

    let searchRepoRemoteDataSource: SearchRepoRemoteDataSource

    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse> {
        return try await searchRepoRemoteDataSource.execute(searchQuery: searchQuery, page: page)
    }
}
