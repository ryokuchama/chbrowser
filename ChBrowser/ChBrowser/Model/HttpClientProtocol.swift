//
//  HttpClientProtocol.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

protocol HttpClientProtocol {
    
    /// HTTP GET
    /// - Parameter body: URL target
    /// - Returns:Data Object
    func get(body: String) async -> Data?
    func post(header: String, body: String) async throws
}
