//
//  UIViewController+.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/04/03.
//

import SwiftUI
import UIKit

extension UIViewController {

    func addUIHostingController<Content: View>(swiftUIView: Content) {
        let hostingVC = UIHostingController(rootView: swiftUIView)
        addChild(hostingVC)
        hostingVC.didMove(toParent: self)
        view.addSubview(hostingVC.view)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        hostingVC.view.pinEdgesToSuperview()
    }
}
