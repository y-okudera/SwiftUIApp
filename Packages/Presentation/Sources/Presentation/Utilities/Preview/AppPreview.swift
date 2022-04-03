//
//  AppPreview.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import SwiftUI

struct AppPreview<Content>: View where Content: View {
    let content: () -> Content

    private let previewDevices = [
        "iPhone 13"
    ]

    var body: some View {
        ForEach(previewDevices, id: \.self) { previewDevice in
            content()
                .previewDevice(PreviewDevice(rawValue: previewDevice))
                .previewDisplayName("light-portrait-\(previewDevice)")
            content()
                .previewDevice(PreviewDevice(rawValue: previewDevice))
                .previewDisplayName("light-landscape-\(previewDevice)")
                .landscape()
        }

        // Dark Mode
        content()
            .preferredColorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("dark-portrait-iPhone 8")
    }
}

// MARK: - private struct
private struct LandscapeModifier: ViewModifier {
    private let height = UIScreen.main.bounds.width
    private let width = UIScreen.main.bounds.height

    private var isPad: Bool {
        return height >= 768
    }

    private var isRegularWidth: Bool {
        return height >= 414
    }

    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height))
            .environment(\.horizontalSizeClass, isRegularWidth ? .regular : .compact)
            .environment(\.verticalSizeClass, isPad ? .regular : .compact)
    }
}

// MARK: - extension
extension View {
    func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}
