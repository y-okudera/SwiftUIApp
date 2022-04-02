//
//  RepoListViewController.swift
//  Presentation
//
//  Created by okudera on 2022/04/02.
//

import AppCore
import UIKit
import SwiftUI

protocol RepoListViewControllerProtocol: UIViewController, RepoListPresenterOutput {
    func configure(dataSource: RepoListView.DataSource, presenter: RepoListPresenter)
}

final class RepoListViewController: UIViewController {

    private var dataSource: RepoListView.DataSource!
    private var presenter: RepoListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIView = RepoListView(input: self, dataSource: dataSource)
        addUIHostingController(swiftUIView: swiftUIView)
    }
}

extension RepoListViewController: RepoListViewControllerProtocol {

    func configure(dataSource: RepoListView.DataSource, presenter: RepoListPresenter) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
}

extension RepoListViewController: RepoListPresenterOutput {

    func searchResults(items: [GitHubRepository], hasNext: Bool) {
        dataSource.repositories = items
        dataSource.hasNext = hasNext
    }

    func loadMoreResults(items: [GitHubRepository], hasNext: Bool) {
        dataSource.repositories.append(contentsOf: items)
        dataSource.hasNext = hasNext
    }

    func errorOccurred(errorTitle: String, errorMessage: String, retryHandler: (() -> Void)?) {
        dataSource.errorTitle = errorTitle
        dataSource.errorMessage = errorMessage
        dataSource.retryHandler = retryHandler
        dataSource.isErrorShown = true
    }
}

extension RepoListViewController: RepoListViewInput {

    func repoListViewSearchRepositories(searchQuery: String) {
        Task {
            await presenter.searchRepositories(searchQuery: searchQuery)
        }
    }

    func repoListViewLoadMoreRepositories() {
        Task {
            await presenter.loadMoreRepositories()
        }
    }

    func repoListViewDidTapRepository(_ repository: GitHubRepository) {
        presenter.didTapRepository(repository)
    }
}
