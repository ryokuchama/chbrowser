//
//  HttpClientTests.swift
//  ChBrowserTests
//
//  Created by 梶健将 on 2023/07/15.
//

import XCTest
@testable import ChBrowser

final class HttpClientTests: XCTestCase {
    
    private var _client: HttpClient = .init()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllBoards5ch() async throws {
        let body: String = "https://menu.5ch.net/bbsmenu.json"
        let result = await _client.get(body: body)
        XCTAssertNotNil(result)
    }
    
    func testGetAllBoardsSannan() async throws {
        let body: String = "https://sannan.nl/sannan_bbsmenu.html"
        let result = await _client.get(body: body)
        XCTAssertNotNil(result)
    }
}
