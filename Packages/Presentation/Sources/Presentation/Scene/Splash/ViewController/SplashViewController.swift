//
//  SplashViewController.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import UIKit

protocol SplashViewControllerProtocol: UIViewController, SplashPresenterOutput {
    func configure(dataSource: SplashView.DataSource, presenter: SplashPresenterInput)
}

final class SplashViewController: UIViewController {

    private var dataSource: SplashView.DataSource!
    private var presenter: SplashPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIView = SplashView(input: self, dataSource: dataSource)
        addUIHostingController(swiftUIView: swiftUIView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

// MARK: - SplashViewControllerProtocol
extension SplashViewController: SplashViewControllerProtocol {

    func configure(dataSource: SplashView.DataSource, presenter: SplashPresenterInput) {
        self.dataSource = dataSource
        self.presenter = presenter
    }
}

// MARK: - SplashPresenterOutput
extension SplashViewController: SplashPresenterOutput {

}

// MARK: - SplashViewInput
extension SplashViewController: SplashViewInput {

}
