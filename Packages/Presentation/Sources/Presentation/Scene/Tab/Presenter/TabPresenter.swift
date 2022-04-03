//
//  TabPresenter.swift
//  Presentation
//
//  Created by yuoku on 2022/04/03.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import AppCore
import Foundation
import UseCase

protocol TabPresenter: AnyObject {
    var wireframe: TabWireframe { get }
    func configure(output: TabPresenterOutput?)
}

// MARK: - PresenterInput
protocol TabPresenterInput: AnyObject {

}

// MARK: - PresenterOutput
protocol TabPresenterOutput: AnyObject {

}

// MARK: - Impl
final class TabPresenterImpl: TabPresenter {

    private weak var output: TabPresenterOutput?
    let wireframe: TabWireframe

    init(wireframe: TabWireframe) {
        self.wireframe = wireframe
    }

    func configure(output: TabPresenterOutput?) {
        self.output = output
    }
}

extension TabPresenterImpl: TabPresenterInput {

}
