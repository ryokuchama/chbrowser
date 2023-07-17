//
//  MainModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class MainModel: MainModelProtocol {
    
    func initialize() {
        let http: HttpClient = .init()
        let body: String = "https://sannan.nl/sannan_bbsmenu.html"
        Task {
            guard let (code, result) = try? await http.get(body: body) else {
                Logger.error("")
                return
            }
        }
        
    }
}
