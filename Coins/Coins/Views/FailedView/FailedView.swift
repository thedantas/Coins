//
//  FailedView.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

import UIKit

protocol FailedViewProtocol {
    func retryAction()
}
class FailedView: UIView {
    let retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Retry", for: .normal)
        button.layer.cornerRadius = 16.0
        button.backgroundColor = .accentColor
        button.addTarget(self, action: #selector(retry), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let failLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "No Results found"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var delegate: FailedViewProtocol?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightOrangeColor
        self.layer.cornerRadius = 16.0
        addSubview(failLabel)
        addSubview(retryButton)
        NSLayoutConstraint.activate([
            failLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            failLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            retryButton.topAnchor.constraint(equalTo: failLabel.bottomAnchor, constant: 24.0),
            retryButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            retryButton.heightAnchor.constraint(equalToConstant: 50.0),
            retryButton.widthAnchor.constraint(equalToConstant: 110.0)
        ])
    }
    @objc func retry() {
        self.delegate?.retryAction()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
