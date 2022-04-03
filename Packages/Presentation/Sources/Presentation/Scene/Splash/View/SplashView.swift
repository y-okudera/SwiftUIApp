//
//  SplashView.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import SwiftUI

protocol SplashViewInput: AnyObject {

}

struct SplashView: View {

    private weak var input: SplashViewInput?

    @ObservedObject
    private var dataSource: DataSource

    init(input: SplashViewInput?, dataSource: DataSource) {
        self.input = input
        self.dataSource = dataSource
    }

    var body: some View {
        VStack {
            Image(uiImage: Asset.gitHubLogo.image)
                .resizable()
                .scaledToFit()
            Image(uiImage: Asset.octocat.image)
                .resizable()
                .scaledToFit()
        }
    }
}

// MARK: - DataSource
extension SplashView {
    class DataSource: ObservableObject {

    }
}

#if DEBUG
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            AppPreview {
                SplashView(input: nil, dataSource: .init())
            }
        }
    }
#endif
