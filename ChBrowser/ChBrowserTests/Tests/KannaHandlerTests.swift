//
//  KannaHandlerTests.swift
//  ChBrowserTests
//
//  Created by 梶健将 on 2023/07/19.
//

import XCTest
@testable import ChBrowser

final class KannaHandlerTests: XCTestCase {
    
    var parser: KannaHandler = .init()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAtag() throws {
        let data = """
                <html><head><title>Welcome to Sannan</title></head><body><a href="https://google.co.jp">Google</a><a href="https://amazon.co.jp">Amazon</a></body></html>
                """
        let result = parser.parse(fromHtmlToStringWithTitle: data, tag: "a")
        XCTAssertEqual(result["title"], "Welcome to Sannan")
        XCTAssertEqual(result["Google"], "https://google.co.jp")
        XCTAssertEqual(result["Amazon"], "https://amazon.co.jp")
    }
    
    func testParseNotHtml() throws {
        let data = "Welcome to Sannan"
        let result = parser.parse(fromHtmlToStringWithTitle: data, tag: "a")
        XCTAssertEqual(result.count, 0)
    }
    
    func testParseNotExistTag() throws {
        let data = """
                <html><head><title>Welcome to Sannan</title></head><body><a href="https://google.co.jp">Google</a><a href="https://amazon.co.jp">Amazon</a></body></html>
                """
        let result = parser.parse(fromHtmlToStringWithTitle: data, tag: "b")
        XCTAssertEqual(result["title"], "Welcome to Sannan")
        XCTAssertEqual(result.count, 1)
    }
}
