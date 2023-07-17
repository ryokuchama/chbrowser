//
//  HttpClient.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class HttpClient: HttpClientProtocol {
    
    func get(body: String) async -> Data? {
        return await withCheckedContinuation { continution in
            let url = URL(string: body)!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let _ = error {
                    continution.resume(returning: nil)
                }
                else {
                    continution.resume(returning: data!)
                }
            }
            task.resume()
        }
    }
    
    func post(header: String, body: String) async throws {
    
    }
}
