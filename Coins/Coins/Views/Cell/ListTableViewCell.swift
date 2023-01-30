//
//  ListTableViewCell.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func update(with viewModel: CoinsListTableViewCellViewModel) {
        nameLabel.text = viewModel.coins.name
        exchangeLabel.text = viewModel.coins.exchangeID
        volumeLabel.text = viewModel.coins.volume1DayUsd?.localeCurrency
    }
}

extension ListTableViewCell: ReusableView, NibLoadableView { }
