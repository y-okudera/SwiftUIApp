//
//  RepoListPresenter.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation
import UseCase

public final class RepoListPresenter: ObservableObject {

    @Published public var inputText = ""
    @Published public var searchQuery = ""
    @Published public var errorTitle = ""
    @Published public var errorMessage = ""
    @Published public var isErrorShown = false
    @Published public var repositories = [GitHubRepository]()
    @Published public var page = 0
    @Published public var hasNext = false

    let searchRepoUseCase: SearchRepoUseCase

    public init(searchRepoUseCase: SearchRepoUseCase) {
        self.searchRepoUseCase = searchRepoUseCase
    }

    @MainActor
    func searchRepositories(inputText: String) async {

        Task {
            do {
                page = 1
                let searchResponse = try await searchRepoUseCase.execute(searchQuery: inputText, page: 1)
                let items = searchResponse.response.items
                print("first item", items)
                print("hasNext", searchResponse.gitHubAPIPagination?.hasNext ?? false)

                repositories = items
                hasNext = searchResponse.gitHubAPIPagination?.hasNext ?? false
                if items.isEmpty {
                    errorTitle = "検索結果"
                    errorMessage = "該当するリポジトリがありません。"
                    isErrorShown = true
                } else {

                }
            } catch {
                print("searchRepositories error", error)
                let nsError = error as NSError
                errorTitle = nsError.localizedDescription
                errorMessage = nsError.localizedRecoverySuggestion ?? "エラーが発生しました。"
                isErrorShown = true
            }
        }


    }

    func additionalSearchRepositories(searchQuery: String, page: Int) {
        // TODO: - 
    }
}
