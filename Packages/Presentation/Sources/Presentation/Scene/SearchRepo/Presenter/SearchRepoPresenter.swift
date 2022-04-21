//
//  SearchRepoPresenter.swift
//  Presentation
//
//  Created by okudera on 2022/04/14.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import Foundation
import UseCase

protocol SearchRepoPresenter: AnyObject {
    // var searchRepoUseCase: SearchRepoUseCase { get }
    var wireframe: SearchRepoWireframe { get }
    func configure(output: SearchRepoPresenterOutput?)
}

// MARK: - PresenterInput
protocol SearchRepoPresenterInput: AnyObject {
    // func searchRepositories(searchQuery: String) async
    // func loadMoreRepositories() async
    // func didTapRepository(_ repository: GitHubRepository)
}

// MARK: - PresenterOutput
protocol SearchRepoPresenterOutput: AnyObject {
    // func searchResults(items: [GitHubRepository], hasNext: Bool)
    // func loadMoreResults(items: [GitHubRepository], hasNext: Bool)
    // func errorOccurred(errorTitle: String, errorMessage: String, retryHandler: (() -> Void)?)
}

// MARK: - Impl
final class SearchRepoPresenterImpl: SearchRepoPresenter {

    private weak var output: SearchRepoPresenterOutput?
    // private var searchQuery = ""
    // private var page = 0

    let searchRepoUseCase: SearchRepoUseCase
    let wireframe: SearchRepoWireframe

    init(searchRepoUseCase: SearchRepoUseCase, wireframe: SearchRepoWireframe) {
        self.searchRepoUseCase = searchRepoUseCase
        self.wireframe = wireframe
    }

    func configure(output: SearchRepoPresenterOutput?) {
        self.output = output
    }
}

extension SearchRepoPresenterImpl: SearchRepoPresenterInput {

    // @MainActor
    // func searchRepositories(searchQuery: String) async {
    //     Task {
    //         do {
    //             self.searchQuery = searchQuery
    //             page = 1

    //             let searchResponse = try await searchRepoUseCase.execute(
    //                 searchQuery: searchQuery, page: 1)
    //             output?.searchResults(
    //                 items: searchResponse.response.items,
    //                 hasNext: searchResponse.gitHubAPIPagination?.hasNext ?? false
    //             )

    //             guard searchResponse.response.items.isEmpty else {
    //                 return
    //             }
    //             output?.errorOccurred(
    //                 errorTitle: "検索結果",
    //                 errorMessage: "該当するリポジトリがありません。",
    //                 retryHandler: nil
    //             )
    //         } catch {
    //             print("searchRepositories error", error)

    //             let nsError = error as NSError
    //             output?.errorOccurred(
    //                 errorTitle: nsError.localizedDescription,
    //                 errorMessage: nsError.localizedRecoverySuggestion ?? "エラーが発生しました。",
    //                 retryHandler: { [weak self] in
    //                     guard let self = self else { return }
    //                     Task { await self.searchRepositories(searchQuery: searchQuery) }
    //                 }
    //             )
    //         }
    //     }
    // }

    // @MainActor
    // func loadMoreRepositories() async {
    //     Task {
    //         do {
    //             page += 1
    //             let searchResponse = try await searchRepoUseCase.execute(
    //                 searchQuery: searchQuery, page: page)
    //             output?.loadMoreResults(
    //                 items: searchResponse.response.items,
    //                 hasNext: searchResponse.gitHubAPIPagination?.hasNext ?? false
    //             )
    //         } catch {
    //             print("searchRepositories error", error)
    //             page -= 1

    //             let nsError = error as NSError
    //             output?.errorOccurred(
    //                 errorTitle: nsError.localizedDescription,
    //                 errorMessage: nsError.localizedRecoverySuggestion ?? "エラーが発生しました。",
    //                 retryHandler: { [weak self] in
    //                     guard let self = self else { return }
    //                     Task { await self.loadMoreRepositories() }
    //                 }
    //             )
    //         }
    //     }
    // }

    // func didTapRepository(_ repository: GitHubRepository) {
    //     print(#function, "repository", repository)
    // }
}
