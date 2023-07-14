//
//  HttpClient.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class HttpClient: HttpClientProtocol {
    
    func get(body: String) async throws -> (Int, Data) {
        return await withCheckedContinuation { continution in
            let url = URL(string: body)!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let e = error {
                    continution.resume(throwing: e as! Never)
                }
                else {
                    let res: HTTPURLResponse = response as! HTTPURLResponse
                    continution.resume(returning: (res.statusCode, data!))
                }
            }
            task.resume()
        }
    }
    
    func post(header: String, body: String) async throws {
    
    }
}
