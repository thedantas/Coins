//
//  Result.swift
//  SwiftyRestKit
//
//
//  Created by André  Costa Dantas on 25/01/23.
//

import Foundation

public enum Result<T: Decodable> {
    case Success(T)
    case Failure(Error)
}
