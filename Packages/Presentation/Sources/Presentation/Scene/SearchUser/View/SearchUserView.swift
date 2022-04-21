//
//  SearchUserView.swift
//  Presentation
//
//  Created by yuoku on 2022/04/10.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import SwiftUI

protocol SearchUserViewInput: AnyObject {
    // func repoListViewSearchRepositories(searchQuery: String)
    // func repoListViewLoadMoreRepositories()
    // func repoListViewDidTapRepository(_ repository: GitHubRepository)
}

struct SearchUserView: View {

    private weak var input: SearchUserViewInput?

    @ObservedObject
    private var dataSource: DataSource

    init(input: SearchUserViewInput?, dataSource: DataSource) {
        self.input = input
        self.dataSource = dataSource
    }

    var body: some View {
        Text("SearchUser")
    }
}

// MARK: - DataSource
extension SearchUserView {
    class DataSource: ObservableObject {
        @Published var inputText = ""
        @Published var isErrorShown = false
        @Published var repositories = [GitHubRepository]()
        @Published var hasNext = false

        var errorTitle = ""
        var errorMessage = ""
        var retryHandler: (() -> Void)? = nil
    }
}

extension SearchUserView.DataSource {
    static let mock: SearchUserView.DataSource = {
        let mock = SearchUserView.DataSource()
        mock.inputText = "Swift"
        mock.repositories = [
            .init(
                id: 1,
                name: "y-okudera",
                fullName: "y-okudera/SwiftUIApp",
                description: "Swift Package based App.",
                stargazersCount: 1234,
                language: "Swift",
                htmlUrl: URL(string: "https://github.com/y-okudera/SwiftUIApp")!,
                owner: GitHubUser(
                    id: 100,
                    login: "mock",
                    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/25205138?v=4")!,
                    htmlUrl: URL(string: "https://github.com/y-okudera")!,
                    type: "User"
                )
            )
        ]
        return mock
    }()
}

#if DEBUG
    struct SearchUserView_Previews: PreviewProvider {
        static var previews: some View {
            AppPreview {
                SearchUserView(input: nil, dataSource: .mock)
            }
        }
    }
#endif
