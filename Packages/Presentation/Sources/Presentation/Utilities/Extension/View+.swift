//
//  View+.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import SwiftUI

// MARK: - hidden

extension View {
    func hidden(_ isHidden: Bool) -> some View {
        ModifiedContent(content: self, modifier: Hidden(hidden: isHidden))
    }
}

private struct Hidden: ViewModifier {
    let hidden: Bool

    func body(content: Content) -> some View {
        if !hidden {
            content
        }
    }
}
