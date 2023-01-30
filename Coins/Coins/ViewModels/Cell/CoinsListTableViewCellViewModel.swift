//
//  MatchListTableViewCellViewModel.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

import Foundation
import UIKit

struct CoinsListTableViewCellViewModel {
    // MARK: - Properties
    var coins: Crypto
    // MARK: - Init
    init(model: Crypto) {
        self.coins = model
    }
}
