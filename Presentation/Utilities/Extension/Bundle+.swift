//
//  Bundle+.swift
//  Presentation
//
//  Created by okudera on 2022/02/23.
//

import Foundation

extension Bundle {
    static var current: Bundle {
        class DummyClass {}
        return Bundle(for: type(of: DummyClass()))
    }
}
