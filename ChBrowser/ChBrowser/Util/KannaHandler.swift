//
//  Kanna.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/17.
//

import Foundation
import Kanna

class KannaHandler: ParserProtocol {
    
    func parse(fromHtmlToAAndHref text: String, encoding: String.Encoding = .utf8) -> [String: String]? {
        do {
            let doc = try HTML(html: text, encoding: encoding)
            // `css selector` is faster, so adopted as the research algolism
            // because `xpath` research tag bidirectional,
            // on the other hand, `css selector` reseach tag unidirectional.
            var dict: [String:String] = [:]
            dict["title"] = doc.title
            for d in doc.css(text) {
                dict[d["a"]!] = d["href"]
            }
            return dict
        }
        catch {
            Logger.error("HTML parse failed.")
            return nil
        }
    }
}
