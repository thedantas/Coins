//
//  HTTPTask.swift
//  SwiftyRestKit
//
//
//  Created by André  Costa Dantas on 25/01/23.
//

import Foundation

public typealias HTTPHeader = [String : String]

public enum HTTPTask {
    case request
    case requestWith(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestWithHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeader?)
}
