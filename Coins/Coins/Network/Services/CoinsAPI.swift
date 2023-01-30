//
//  CSAPI.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation

enum CoinsAPI {
    case allMatchs(page: Int)
    case showDetails(matchID: String)
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
        return "D36BB7EF-DA20-442A-A6C8-70BA2243DFAE"
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
        case .showDetails(let teamID):
            return "v1/exchanges/\(teamID)"
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
        case .allMatchs(let page):
            let urlParameters: Parameters = ["page" : page]
            return .requestWithHeaders(bodyParameters: nil, urlParameters: urlParameters, additionalHeaders: headers)
        case .showDetails(let teamID):
            let urlParameters: Parameters = ["filter_symbol_id" : teamID]
            return .requestWithHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: headers)
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

