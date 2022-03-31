//
//  RepoListView.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import SwiftUI
import UseCase

public struct RepoListView: View {

    @ObservedObject
    private var presenter: RepoListPresenter

    public init(presenter: RepoListPresenter) {
        self.presenter = presenter
    }

    public var body: some View {
        SearchNavigation(
            text: $presenter.inputText,
            search: {
                Task {
                    await presenter.searchRepositories(inputText: presenter.inputText)
                }
            }
        ) {
            List {
                ForEach(presenter.repositories) { repository in
                    RepoListRow(title: repository.fullName, language: repository.language ?? "") {
                        print(repository.fullName, repository.language ?? "")
                    }
                }
                HStack {
                    Spacer()
                    ProgressView()
                        .onAppear {
                            presenter.additionalSearchRepositories(searchQuery: presenter.searchQuery, page: presenter.page)
                        }
                    Spacer()
                }
                // 次のページがない場合、リスト末尾にインジケーターを表示しない
                .hidden(!presenter.hasNext)
            }
            .alert(isPresented: $presenter.isErrorShown) { () -> Alert in
                Alert(title: Text(presenter.errorTitle), message: Text(presenter.errorMessage))
            }
            .navigationBarTitle(Text("repo_list_view.navigation_bar_title", bundle: .module))
        }
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

//#if DEBUG
//struct RepoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppPreview {
//            RepoListView(presenter: .mock)
//        }
//    }
//}
//#endif
