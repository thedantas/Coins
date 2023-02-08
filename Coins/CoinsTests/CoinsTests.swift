//
//  CoinsTests.swift
//  CoinsTests
//
//  Created by André  Costa Dantas on 23/01/23.
//

import XCTest
@testable import Coins

final class CoinsTests: XCTestCase {
    let viewModel = DetailsViewModel(service: Services())
    var mockModel = DetailCrypto()
    private let service: Gettable? = nil
    override func setUpWithError() throws {

        guard let path = Bundle.main.path(forResource: "crypto", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            mockModel = try JSONDecoder().decode(DetailCrypto.self, from: jsonData)
        } catch {
            XCTFail("Error fetching mock json")
        }
    }

    func testViewModel() {
        viewModel.fetchCryptoDetail(exchangeID: mockModel[0].exchangeID ?? "BINANCE"){_ in
            guard let service = self.service as? Services else {
                XCTFail("Error fetching mock json")
                return
            }
            service.fetchCrypto(exchangeID: self.mockModel[0].exchangeID ?? "BINANCE") { [] (result) in
                switch result {
                case .Success(let shows):
                    XCTAssertTrue(true)
                case .Failure(let error):
                    XCTFail("Error fetching mock json")
                }
            }
        }
    }

}
