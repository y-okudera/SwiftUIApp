//
//  App.swift
//  SwiftUIApp
//
//  Created by okudera on 2022/02/23.
//

import Presentation
import SwiftUI

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            RepoListView()
        }
    }
}
