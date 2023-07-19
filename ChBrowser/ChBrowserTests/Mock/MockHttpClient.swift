//
//  MockHttpClient.swift
//  ChBrowserTests
//
//  Created by 梶健将 on 2023/07/19.
//

import Foundation
@testable import ChBrowser

class MockCorrectHttpClient: HttpClientProtocol {
    func get(body: String) async -> Data? {
        return await withCheckedContinuation() { continution in
            let str = """
                    <html><head><title>Welcome to Sannan</title></head><body><a href="https://google.co.jp">Google</a><a href="https://amazon.co.jp">Amazon</a></body></html>
                    """
            let data: Data? = str.data(using: .utf8)
            continution.resume(returning: data)
        }
    }
    
    func post(header: String, body: String) async throws {
        
    }
}

class MockErrorHttpClient: HttpClientProtocol {
    func get(body: String) async -> Data? {
        return await withCheckedContinuation() { continution in
            continution.resume(returning: nil)
        }
    }
    
    func post(header: String, body: String) async throws {
        
    }
}
