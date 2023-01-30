//
//  Date+Helpers.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 07/11/22.
//

import Foundation

extension Date {
    var isPastDate: Bool {
        return self <= Date()
    }
}
