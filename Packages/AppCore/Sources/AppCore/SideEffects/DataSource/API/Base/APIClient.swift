//
//  APIClient.swift
//  AppCore
//
//  Created by Yuki Okudera on 2022/03/31.
//

import Foundation

public protocol APIClient {
    func sendRequest<T: APIRequestable>(_ apiRequest: T) async throws -> APIResponse<T.Response>
}
