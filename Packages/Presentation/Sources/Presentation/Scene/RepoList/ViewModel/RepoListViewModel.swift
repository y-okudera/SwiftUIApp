//
//  RepoListViewModel.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation
import UseCase

public final class RepoListViewModel: ObservableObject {

    @Published var inputText = ""
    @Published var isErrorShown = false
    @Published private(set) var repositories = [GitHubRepository]()
    @Published private(set) var hasNext = false

    private(set) var errorTitle = ""
    private(set) var errorMessage = ""

    private var searchQuery = ""
    private var page = 0

    let searchRepoUseCase: SearchRepoUseCase

    public init(searchRepoUseCase: SearchRepoUseCase) {
        self.searchRepoUseCase = searchRepoUseCase
    }

    @MainActor
    func searchRepositories() async {
        Task {
            do {
                searchQuery = inputText
                page = 1

                let searchResponse = try await searchRepoUseCase.execute(searchQuery: searchQuery, page: 1)
                repositories = searchResponse.response.items
                hasNext = searchResponse.gitHubAPIPagination?.hasNext ?? false
                showMessageIfSearchResultIsEmpty(with: searchResponse)
            } catch {
                print("searchRepositories error", error)
                showErrorMessage(error: error)
            }
        }
    }

    @MainActor
    func additionalSearchRepositories() {
        Task {
            do {
                page += 1
                let searchResponse = try await searchRepoUseCase.execute(searchQuery: searchQuery, page: page)
                repositories.append(contentsOf: searchResponse.response.items)
                hasNext = searchResponse.gitHubAPIPagination?.hasNext ?? false
            } catch {
                print("searchRepositories error", error)
                page -= 1
                showErrorMessage(error: error)
            }
        }
    }

    @MainActor
    private func showMessageIfSearchResultIsEmpty(with searchResponse: APIResponse<SearchRepoResponse>) {
        guard searchResponse.response.items.isEmpty else {
            return
        }
        errorTitle = "検索結果"
        errorMessage = "該当するリポジトリがありません。"
        isErrorShown = true
    }

    @MainActor
    private func showErrorMessage(error: Error) {
        let nsError = error as NSError
        errorTitle = nsError.localizedDescription
        errorMessage = nsError.localizedRecoverySuggestion ?? "エラーが発生しました。"
        isErrorShown = true
    }
}
