//
//  InternalError.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation

enum InternalError: Error {
    case decodingError
    case noDataError
    case urlBuildingError
    case validationError
    case unknownError
}
