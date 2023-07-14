//
//  HttpClientProtocol.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

protocol HttpClientProtocol {
    
    /// HTTP GET
    /// - Parameter body: the target to get
    /// - Returns:
    ///     - Int: result code
    ///     - Data: data
    func get(body: String) async throws -> (Int, Data)
    func post(header: String, body: String) async throws
}
