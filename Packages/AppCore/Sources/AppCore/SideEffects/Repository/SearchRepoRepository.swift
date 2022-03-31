//
//  SearchRepoRepository.swift
//  Infrastructure
//
//  Created by Yuki Okudera on 2022/03/31.
//

import Foundation

public protocol SearchRepoRepository {
    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepoResponse>
}
