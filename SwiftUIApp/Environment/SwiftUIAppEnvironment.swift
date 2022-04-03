//
//  SwiftUIAppEnvironment.swift
//  SwiftUIApp
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation

let env = SwiftUIAppEnvironment()

final class SwiftUIAppEnvironment: AppEnvironment {

    var apiClient: APIClient {
        APIClientImpl.shared
    }

    var searchRepoRemoteDataSource: SearchRepoRemoteDataSource {
        SearchRepoRemoteDataSourceImpl(environment: self)
    }

    var searchRepoRepository: SearchRepoRepository {
        SearchRepoRepositoryImpl(searchRepoRemoteDataSource: self.searchRepoRemoteDataSource)
    }
}
