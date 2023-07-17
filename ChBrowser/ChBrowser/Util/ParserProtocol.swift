//
//  ParserProtocol.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/17.
//

import Foundation

protocol ParserProtocol {
    
    /// Parse HTML, return Dictionary
    /// - Parameters:
    ///   - text: target String
    ///   - encoding: Text encoding
    /// - Returns: Dict[String:String]
    func parse(fromHtmlToAAndHref text: String, encoding: String.Encoding) -> [String: String]?
}
