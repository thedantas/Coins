//
//  ParameterEncoder.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 01/11/22.
//


import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
