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
    private var viewModel: RepoListViewModel

    public init(viewModel: RepoListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        SearchNavigation(
            text: $viewModel.inputText,
            search: { Task { await viewModel.searchRepositories() } }
        ) {
            List {
                ForEach(viewModel.repositories) { repository in
                    RepoListRow(title: repository.fullName, language: repository.language ?? "") {
                        print(repository.fullName, repository.language ?? "")
                    }
                }
                HStack {
                    Spacer()
                    ProgressView()
                        .onAppear {
                            viewModel.additionalSearchRepositories()
                        }
                    Spacer()
                }
                // 次のページがない場合、リスト末尾にインジケーターを表示しない
                .hidden(!viewModel.hasNext)
            }
            .alert(isPresented: $viewModel.isErrorShown) { () -> Alert in
                Alert(title: Text(viewModel.errorTitle), message: Text(viewModel.errorMessage))
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
