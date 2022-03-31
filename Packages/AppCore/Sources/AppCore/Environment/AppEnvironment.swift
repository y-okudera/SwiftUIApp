//
//  AppEnvironment.swift
//  AppCore
//
//  Created by Yuki Okudera on 2022/03/31.
//

import Foundation
import UIKit

public protocol AppEnvironment {

    // MARK: - Infrastructure

    var apiClient: APIClient { get }

    // MARK: - DataSource

    var searchRepoRemoteDataSource: SearchRepoRemoteDataSource { get }

    // MARK: - Repository

    var searchRepoRepository: SearchRepoRepository { get }
}
