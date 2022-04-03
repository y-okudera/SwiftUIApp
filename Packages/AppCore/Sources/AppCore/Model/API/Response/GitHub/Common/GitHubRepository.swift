//
//  GitHubRepository.swift
//  AppCore
//
//  Created by Yuki Okudera on 2022/03/31.
//

import Foundation

public struct GitHubRepository: Decodable, Identifiable {
    public let id: Int64
    public let fullName: String
    public let description: String?
    public let stargazersCount: Int
    public let language: String?
    public let htmlUrl: URL
    public let owner: GitHubUser

    public init(
        id: Int64,
        fullName: String,
        description: String?,
        stargazersCount: Int,
        language: String?,
        htmlUrl: URL,
        owner: GitHubUser
    ) {
        self.id = id
        self.fullName = fullName
        self.description = description
        self.stargazersCount = stargazersCount
        self.language = language
        self.htmlUrl = htmlUrl
        self.owner = owner
    }
}
