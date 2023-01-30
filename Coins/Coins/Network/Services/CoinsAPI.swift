//
//  CSAPI.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation

enum CoinsAPI {
    case allMatchs
    case showDetails(exchangeID: String)
}

extension CoinsAPI: EndPointType {
    var apiClientKey: String? {
        return nil
    }
    var apiClientSecret: String? {
        return nil
    }
    var baseURLString : String {
        return "https://rest.coinapi.io/"
    }
    var token : String {
        return "90A84537-D511-4890-9580-4BE50BF76762"
    }
    var baseURL: URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("baseURL could not be configured.")}
        return url
    }
    var path: String {
        switch self {
        case .allMatchs:
            return "v1/exchanges/"
        case .showDetails(let exchangeID):
            return "v1/exchanges/\(exchangeID)"
        }
    }
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    var task: HTTPTask {
        switch self {
        case .allMatchs:
            return .requestWithHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: headers)
        case .showDetails(let exchangeID):
            let parameters: Parameters = ["filter_symbol_id" : exchangeID]
            return .requestWithHeaders(bodyParameters: nil, urlParameters: parameters, additionalHeaders: headers)
        }
    }
    var headers: HTTPHeader? {
        switch self {
        default:
            return [
                "X-CoinAPI-Key": "\(token)",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
}
