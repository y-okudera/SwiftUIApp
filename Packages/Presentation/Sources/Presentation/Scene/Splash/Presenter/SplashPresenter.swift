//
//  SplashPresenter.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import Foundation
import UseCase

protocol SplashPresenter: AnyObject {
    var wireframe: SplashWireframe { get }
    func configure(output: SplashPresenterOutput?)
}

// MARK: - PresenterInput
protocol SplashPresenterInput: AnyObject {
    func viewWillAppear()
}

// MARK: - PresenterOutput
protocol SplashPresenterOutput: AnyObject {

}

// MARK: - Impl
final class SplashPresenterImpl: SplashPresenter {

    private weak var output: SplashPresenterOutput?
    let wireframe: SplashWireframe

    init(wireframe: SplashWireframe) {
        self.wireframe = wireframe
    }

    func configure(output: SplashPresenterOutput?) {
        self.output = output
    }
}

extension SplashPresenterImpl: SplashPresenterInput {

    func viewWillAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.wireframe.presentTab()
        }
    }
}
