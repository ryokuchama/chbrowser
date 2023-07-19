//
//  MockParser.swift
//  ChBrowserTests
//
//  Created by 梶健将 on 2023/07/19.
//

import Foundation
@testable import ChBrowser

class MockCorrectParser: ParserProtocol {
    func parse(fromHtmlToString text: String, tag: String, encoding: String.Encoding) -> [String : String] {
        return ["title":"Welcome to Sannan!"]
    }
}

class MockErrorParser: ParserProtocol {
    func parse(fromHtmlToString text: String, tag: String, encoding: String.Encoding) -> [String : String] {
        return [:]
    }
}
