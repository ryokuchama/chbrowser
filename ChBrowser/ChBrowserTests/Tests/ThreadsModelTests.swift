//
//  ThreadsModelTests.swift
//  ChBrowserTests
//
//  Created by 梶健将 on 2023/07/24.
//

import XCTest
@testable import ChBrowser

final class ThreadsModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialize() async {
        let model: ThreadsModel = .init()
        let http: HttpClient = .init()
        model.httpClient = http
        let url: String = "https://sannan.nl/livegalileo/"
        await model.initialize(url: url)
    }
}
