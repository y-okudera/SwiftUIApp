//
//  InjectedValues+.swift
//  Infrastructure
//
//  Created by okudera on 2022/02/24.
//

import Injected

// MARK: - APIClientProviderKey
private struct APIClientProviderKey: InjectionKey {
    static var currentValue: APIClientProviding = APIClient()
}

extension InjectedValues {
    var apiClientProvider: APIClientProviding {
        get { Self[APIClientProviderKey.self] }
        set { Self[APIClientProviderKey.self] = newValue }
    }
}
