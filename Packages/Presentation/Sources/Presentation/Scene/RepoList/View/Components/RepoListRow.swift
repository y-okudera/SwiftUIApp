//
//  RepoListRow.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import SwiftUI

struct RepoListRow: View {
    @State var title: String
    @State var language: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                HStack {
                    Text(title)
                        .lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text(language)
                        .lineLimit(1)
                        .font(.caption)
                    Spacer()
                }
            }
            .foregroundColor(Color(Asset.text.color))
        }
    }
}

#if DEBUG
    struct RepoListRow_Previews: PreviewProvider {
        static var previews: some View {
            AppPreview {
                RepoListRow(title: "octocat/Spoon-Knife", language: "HTML", action: {})
                    .previewLayout(.sizeThatFits)
            }
        }
    }
#endif
