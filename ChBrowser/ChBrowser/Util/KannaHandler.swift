//
//  Kanna.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/17.
//

import Foundation
import Kanna

class KannaHandler: ParserProtocol {

   func parse(fromHtmlToStringWithTitle data: Data, tag: String, encoding: String.Encoding = .utf8) -> [String: String]? {
       do {
           let doc = try HTML(html: data, encoding: encoding)
           return parse(document: doc, tag: tag)
       } catch {
           Logger.error("HTML parse failed.")
           return nil
       }
    }
    
    func parse(fromHtmlToStringWithTitle text: String, tag: String, encoding: String.Encoding = .utf8) -> [String : String]? {
        do {
            let doc = try HTML(html: text, encoding: encoding)
            return parse(document: doc, tag: tag)
        } catch {
            Logger.error("HTML parse failed.")
            return nil
        }
    }
    
    private func parse(document: HTMLDocument, tag: String) -> [String:String]? {
        // `css selector` is faster, so adopted as the research algolism
        // because `xpath` research tag bidirectional,
        // on the other hand, `css selector` reseach tag unidirectional.
        var dict: [String:String] = [:]
        for d in document.css(tag) {
            if let text = d.text {
                if tag == "a" {
                    dict[text] = d["href"]
                } else {
                    dict[tag] = d[text]
                }
            }
        }
        guard dict.count > 0 else {
            Logger.error("tag \(tag) not found")
            return nil
        }
        dict["title"] = document.title
        return dict
    }
}
