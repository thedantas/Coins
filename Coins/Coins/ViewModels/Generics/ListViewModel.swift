//
//  ListViewModel.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

import Foundation

protocol ListViewModel {
    associatedtype Model

    var items: [Model] {get}

    func addItems(_ items: [Model])
    func removeAllItems()
    func numberOfRows(_ section: Int) -> Int
    func modelAt(_ index: Int) -> Model
}

extension ListViewModel {
    func numberOfRows(_ section: Int) -> Int {
        return items.count
    }
    
    func modelAt(_ index: Int) -> Model {
        return items[index]
    }
}
