//
//  MainModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class MainModel: MainModelProtocol {
    
    var parser: ParserProtocol?
    
    func initialize() {
        let http: HttpClient = .init()
        let body: String = "https://sannan.nl/sannan_bbsmenu.html"
        Task {
            guard let result = await http.get(body: body) else {
                Logger.error("Access to \(body), but the result is not returned")
                return
            }
            let toString: String = try! JSONSerialization.jsonObject(with: result) as! String
            let parsed = parser?.parse(fromHtmlToAAndHref: toString, encoding: .shiftJIS)
            Logger.info("parsed: \(String(describing: parsed))")
        }
    }
}
