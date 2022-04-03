//
//  SearchRepoResponse.swift
//  AppCore
//
//  Created by Yuki Okudera on 2022/03/31.
//

import Foundation

public struct SearchRepoResponse: Decodable {
    public let items: [GitHubRepository]
}
