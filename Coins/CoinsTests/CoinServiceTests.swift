//
//  CoinServiceTests.swift
//  CoinsTests
//
//  Created by André  Costa Dantas on 30/01/23.
//

import XCTest
@testable import Coins

class CoinServiceTests: XCTestCase {

    var matchService: Services!

    override func setUp() {
        super.setUp()
        matchService = Services()
    }

    override func tearDown() {
        matchService = nil
        super.tearDown()
    }

    func testFetchAllCryptoCompletes() {
        // given
        let promise = expectation(description: "Completion handler invoked")

        // when
        matchService.fetchAllCryptos { (result) in
            // Then
            promise.fulfill()
        }

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testFetchAllCryptoGetsSuccessResult() {
        // given
        let promise = expectation(description: "Status code: 200")

        // when
        matchService.fetchAllCryptos { (result) in
            switch result {
            case .Success(let shows):
                XCTAssertNotNil(shows)

                promise.fulfill()
            case .Failure:
                XCTFail()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
