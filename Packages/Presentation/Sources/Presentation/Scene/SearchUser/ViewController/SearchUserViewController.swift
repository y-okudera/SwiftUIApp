//
//  SearchUserViewController.swift
//  Presentation
//
//  Created by yuoku on 2022/04/10.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit

protocol SearchUserViewControllerProtocol: UIViewController, SearchUserPresenterOutput {
    func configure(dataSource: SearchUserView.DataSource, presenter: SearchUserPresenterInput)
}

final class SearchUserViewController: UIViewController {

    private var dataSource: SearchUserView.DataSource!
    private var presenter: SearchUserPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIView = SearchUserView(input: self, dataSource: dataSource)
        addUIHostingController(swiftUIView: swiftUIView)
    }
}

// MARK: - SearchUserViewControllerProtocol
extension SearchUserViewController: SearchUserViewControllerProtocol {

    func configure(dataSource: SearchUserView.DataSource, presenter: SearchUserPresenterInput) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
}

// MARK: - SearchUserPresenterOutput
extension SearchUserViewController: SearchUserPresenterOutput {

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

// MARK: - SearchUserViewInput
extension SearchUserViewController: SearchUserViewInput {

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
