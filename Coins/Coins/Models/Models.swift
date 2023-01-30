//
//  Models.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

struct Crypto: Codable {
    let exchangeID: String?
    let website: String?
    let name, dataStart, dataEnd, dataQuoteStart: String?
    let dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd, dataTradeStart: String?
    let dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double?

    enum CodingKeys: String, CodingKey {
        case exchangeID = "exchange_id"
        case website, name
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
    }
}

// MARK: - DetailCryptoElement
typealias DetailCrypto = [Crypto]
