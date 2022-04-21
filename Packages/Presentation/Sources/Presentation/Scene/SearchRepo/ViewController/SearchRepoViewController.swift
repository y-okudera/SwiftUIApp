//
//  SearchRepoViewController.swift
//  Presentation
//
//  Created by okudera on 2022/04/14.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit

protocol SearchRepoViewControllerProtocol: UIViewController, SearchRepoPresenterOutput {
    func configure(dataSource: SearchRepoView.DataSource, presenter: SearchRepoPresenterInput)
}

final class SearchRepoViewController: UIViewController {

    private var dataSource: SearchRepoView.DataSource!
    private var presenter: SearchRepoPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIView = SearchRepoView(input: self, dataSource: dataSource)
        addUIHostingController(swiftUIView: swiftUIView)
    }
}

// MARK: - SearchRepoViewControllerProtocol
extension SearchRepoViewController: SearchRepoViewControllerProtocol {

    func configure(dataSource: SearchRepoView.DataSource, presenter: SearchRepoPresenterInput) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
}

// MARK: - SearchRepoPresenterOutput
extension SearchRepoViewController: SearchRepoPresenterOutput {

    // func searchResults(items: [GitHubRepository], hasNext: Bool) {
    //     dataSource.repositories = items
    //     dataSource.hasNext = hasNext
    // }

    // func loadMoreResults(items: [GitHubRepository], hasNext: Bool) {
    //     dataSource.repositories.append(contentsOf: items)
    //     dataSource.hasNext = hasNext
    // }

    // func errorOccurred(errorTitle: String, errorMessage: String, retryHandler: (() -> Void)?) {
    //     dataSource.errorTitle = errorTitle
    //     dataSource.errorMessage = errorMessage
    //     dataSource.retryHandler = retryHandler
    //     dataSource.isErrorShown = true
    // }
}

// MARK: - SearchRepoViewInput
extension SearchRepoViewController: SearchRepoViewInput {

    // func repoListViewSearchRepositories(searchQuery: String) {
    //     Task {
    //         await presenter.searchRepositories(searchQuery: searchQuery)
    //     }
    // }

    // func repoListViewLoadMoreRepositories() {
    //     Task {
    //         await presenter.loadMoreRepositories()
    //     }
    // }

    // func repoListViewDidTapRepository(_ repository: GitHubRepository) {
    //     presenter.didTapRepository(repository)
    // }
}
