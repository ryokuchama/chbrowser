//
//  MainModelTests.swift
//  ChBrowserTests
//
//  Created by 梶健将 on 2023/07/18.
//

import XCTest
@testable import ChBrowser

final class MainModelTests: XCTestCase {
    
    let model: MainModel = .init()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialize() async {
        let http: MockCorrectHttpClient = .init()
        let parser: MockCorrectParser = .init()
        model.httpClient = http
        model.parser = parser
        let result = await model.initialize()
        XCTAssertEqual(result!["title"], "Welcome to Sannan!")
    }
    
    func testInitializeGetFailed() async {
        let http: MockErrorHttpClient = .init()
        let parser: MockErrorParser = .init()
        model.httpClient = http
        model.parser = parser
        let result = await model.initialize()
        XCTAssertNil(result)
    }
    
    func testInitializeParseFailed() async {
        let http: MockCorrectHttpClient = .init()
        let parser: MockErrorParser = .init()
        model.httpClient = http
        model.parser = parser
        let result = await model.initialize()
        XCTAssertNil(result)
    }
}
