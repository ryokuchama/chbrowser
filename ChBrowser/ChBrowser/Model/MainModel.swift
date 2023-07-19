//
//  MainModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class MainModel: MainModelProtocol {
    
    var parser: ParserProtocol?
    var httpClient: HttpClientProtocol?
    
    func initialize() async -> [String: String]? {
        let body: String = "https://sannan.nl/sannan_bbsmenu.html"
        guard let result = await httpClient!.get(body: body) else {
            Logger.error("Access to \(body), but the result is not returned")
            return nil
        }
        guard let toString: String = String(data: result, encoding: .shiftJIS) else {
            Logger.error("Cast failed: Data to String")
            return nil
        }
        let parsed = parser!.parse(fromHtmlToStringWithTitle: toString, tag: "a", encoding: .shiftJIS)
        Logger.debug("parsed: \(String(describing: parsed))")
        if parsed.count > 0 {
            return parsed
        } else {
            return nil
        }
    }
}
