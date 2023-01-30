//
//  EndPointType.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 01/11/22.
//


import Foundation

public protocol EndPointType: Decodable, Codable {
    var apiClientKey: String? { get }
    var apiClientSecret: String? { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeader? { get }
}
