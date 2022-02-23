//
//  RepoListView.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import Application
import SwiftUI
import Injected

public struct RepoListView: View {
    @ObservedObject private var store: RepoListStore

    @Injected(\.repoListActionCreatorProvider)
    private var actionCreator: RepoListActionCreatorProviding

    public init(store: RepoListStore = .shared) {
        self.store = store
    }

    public var body: some View {
        SearchNavigation(text: $store.inputText, search: { actionCreator.searchRepositories(inputText: store.inputText) }) {
            List {
                ForEach(store.repoAggregateRoot.repositories) { repository in
                    RepoListRow(title: repository.fullName, language: repository.language ?? "") {
                        print(repository.fullName, repository.language ?? "")
                    }
                }
                HStack {
                    Spacer()
                    ProgressView()
                        .onAppear {
                            actionCreator.additionalSearchRepositories(searchQuery: store.searchQuery, page: store.repoAggregateRoot.page)
                        }
                    Spacer()
                }
                // 次のページがない場合、リスト末尾にインジケーターを表示しない
                .hidden(!store.repoAggregateRoot.hasNext)
            }
            .alert(isPresented: $store.isErrorShown) { () -> Alert in
                Alert(title: Text(store.errorTitle), message: Text(store.errorMessage))
            }
            .navigationBarTitle(Text("repo_list_view.navigation_bar_title", bundle: .module))
        }
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

#if DEBUG
struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        AppPreview {
            RepoListView(store: .mock)
        }
    }
}
#endif
