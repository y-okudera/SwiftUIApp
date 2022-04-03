//
//  RepoListPresenter.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/03/31.
//

import AppCore
import Foundation
import UseCase

protocol RepoListPresenter: AnyObject {
    var searchRepoUseCase: SearchRepoUseCase { get }
    var wireframe: RepoListWireframe { get }
    func configure(output: RepoListPresenterOutput?)
}

// MARK: - PresenterInput
protocol RepoListPresenterInput: AnyObject {
    func searchRepositories(searchQuery: String) async
    func loadMoreRepositories() async
    func didTapRepository(_ repository: GitHubRepository)
}

// MARK: - PresenterOutput
protocol RepoListPresenterOutput: AnyObject {
    func searchResults(items: [GitHubRepository], hasNext: Bool)
    func loadMoreResults(items: [GitHubRepository], hasNext: Bool)
    func errorOccurred(errorTitle: String, errorMessage: String, retryHandler: (() -> Void)?)
}

// MARK: - Impl
public final class RepoListPresenterImpl: RepoListPresenter {

    weak var output: RepoListPresenterOutput?
    private var searchQuery = ""
    private var page = 0

    let searchRepoUseCase: SearchRepoUseCase
    let wireframe: RepoListWireframe

    public init(searchRepoUseCase: SearchRepoUseCase, wireframe: RepoListWireframe) {
        self.searchRepoUseCase = searchRepoUseCase
        self.wireframe = wireframe
    }

    func configure(output: RepoListPresenterOutput?) {
        self.output = output
    }
}

extension RepoListPresenterImpl: RepoListPresenterInput {

    @MainActor
    func searchRepositories(searchQuery: String) async {
        Task {
            do {
                self.searchQuery = searchQuery
                page = 1

                let searchResponse = try await searchRepoUseCase.execute(
                    searchQuery: searchQuery, page: 1)
                output?.searchResults(
                    items: searchResponse.response.items,
                    hasNext: searchResponse.gitHubAPIPagination?.hasNext ?? false
                )

                guard searchResponse.response.items.isEmpty else {
                    return
                }
                output?.errorOccurred(
                    errorTitle: "検索結果",
                    errorMessage: "該当するリポジトリがありません。",
                    retryHandler: nil
                )
            } catch {
                print("searchRepositories error", error)

                let nsError = error as NSError
                output?.errorOccurred(
                    errorTitle: nsError.localizedDescription,
                    errorMessage: nsError.localizedRecoverySuggestion ?? "エラーが発生しました。",
                    retryHandler: { [weak self] in
                        guard let self = self else { return }
                        Task { await self.searchRepositories(searchQuery: searchQuery) }
                    }
                )
            }
        }
    }

    @MainActor
    func loadMoreRepositories() async {
        Task {
            do {
                page += 1
                let searchResponse = try await searchRepoUseCase.execute(
                    searchQuery: searchQuery, page: page)
                output?.loadMoreResults(
                    items: searchResponse.response.items,
                    hasNext: searchResponse.gitHubAPIPagination?.hasNext ?? false
                )
            } catch {
                print("searchRepositories error", error)
                page -= 1

                let nsError = error as NSError
                output?.errorOccurred(
                    errorTitle: nsError.localizedDescription,
                    errorMessage: nsError.localizedRecoverySuggestion ?? "エラーが発生しました。",
                    retryHandler: { [weak self] in
                        guard let self = self else { return }
                        Task { await self.loadMoreRepositories() }
                    }
                )
            }
        }
    }

    func didTapRepository(_ repository: GitHubRepository) {
        // TODO: - Will impl
        print(#function, "repository", repository)
        wireframe.presentRepoList()
    }
}
