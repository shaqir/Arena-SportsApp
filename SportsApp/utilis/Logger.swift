//
//  Logger.swift
//  Arena
//
//  Created by Sakir Saiyed.
//

import Foundation

/// Lightweight logger protocol — allows swapping to OSLog or remote logging.
protocol LoggerProtocol {
    func log(_ message: String, category: String)
}

enum Logger: LoggerProtocol {
    static var isEnabled = true

    func log(_ message: String, category: String) {
        Self.log(message, category: category)
    }

    static func log(_ message: String, category: String = "General") {
        guard isEnabled else { return }
        #if DEBUG
        print("[\(category)] \(message)")
        #endif
    }
}
