//
//  DetailViewController.swift
//  Coins
//
//  Created by André  Costa Dantas on 26/01/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let exchangeLabel: UILabel = {
        let label = UILabel()
        label.text = "Exchange:"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let exchangeValue: UILabel = {
        let label = UILabel()
        label.text = "Exchange:"
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nameValue: UILabel = {
        let label = UILabel()
        label.text = "Exchange:"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let volumeHoursLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume por hora:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let volumeHoursValue: UILabel = {
        let label = UILabel()
        label.text = "Exchange:"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let volumeDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Volume do dia:"
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let volumeDayValue: UILabel = {
        let label = UILabel()
        label.text = "Exchange:"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let volumeMounthLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume por mes:"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let volumeMounthValue: UILabel = {
        let label = UILabel()
        label.text = "Exchange:"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Acessar o site", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(touchedWebsiteButton), for: .touchUpInside)
        return button
    }()
    let activityIndicator = UIActivityIndicatorView()
    // MARK: - Properties
    var cypto: Crypto!
    var webSite: String?
    private let viewModel = DetailsViewModel(service: Services())
    // MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Title Detail".localized()
        self.setBackButton()
        navigationItem.largeTitleDisplayMode = .never
        displayCoinsDetails()
        buildUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc private func touchedWebsiteButton() {
        if let url = URL(string: webSite ?? "") {
            UIApplication.shared.open(url)
        }
    }
    func buildUI() {
        self.view.backgroundColor = .lightOrangeColor
        self.view.addSubview(exchangeLabel)
        self.view.addSubview(exchangeValue)
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameValue)
        self.view.addSubview(volumeHoursLabel)
        self.view.addSubview(volumeHoursValue)
        self.view.addSubview(volumeDayLabel)
        self.view.addSubview(volumeDayValue)
        self.view.addSubview(volumeMounthLabel)
        self.view.addSubview(volumeMounthValue)
        self.view.addSubview(nextButton)
        // always a good idea to respect safe area
        let safeG = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            exchangeLabel.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 32.0),
            exchangeLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            exchangeValue.topAnchor.constraint(equalTo: exchangeLabel.bottomAnchor, constant: 8.0),
            exchangeValue.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            nameLabel.topAnchor.constraint(equalTo: exchangeValue.bottomAnchor, constant: 32.0),
            nameLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            nameValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8.0),
            nameValue.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            volumeHoursLabel.topAnchor.constraint(equalTo: nameValue.bottomAnchor, constant: 32.0),
            volumeHoursLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            volumeHoursValue.topAnchor.constraint(equalTo: volumeHoursLabel.bottomAnchor, constant: 8.0),
            volumeHoursValue.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            volumeDayLabel.topAnchor.constraint(equalTo: volumeHoursValue.bottomAnchor, constant: 32.0),
            volumeDayLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            volumeDayValue.topAnchor.constraint(equalTo: volumeDayLabel.bottomAnchor, constant: 8.0),
            volumeDayValue.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            volumeMounthLabel.topAnchor.constraint(equalTo: volumeDayValue.bottomAnchor, constant: 32.0),
            volumeMounthLabel.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),
            volumeMounthValue.topAnchor.constraint(equalTo: volumeMounthLabel.bottomAnchor, constant: 8.0),
            volumeMounthValue.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 16.0),

            nextButton.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 32),
            nextButton.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -32),
            nextButton.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -32.0),
            nextButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    fileprivate func displayCoinsDetails() {
        activityIndicator.startAnimating()

        viewModel.fetchTeam(teamID: cypto.exchangeID ?? "") { [weak self] (result) in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                switch result {
                case .Success:
                    self?.viewModel.items.forEach { item in
                        self?.exchangeValue.text = item.exchangeID
                        self?.nameValue.text = item.name
                        self?.volumeDayValue.text = item.volume1DayUsd?.localeCurrency
                        self?.volumeHoursValue.text = item.volume1HrsUsd?.localeCurrency
                        self?.volumeMounthValue.text = item.volume1MthUsd?.localeCurrency
                        self?.webSite = item.website
                    }
                    self?.viewModel.removeAllItems()
                case.Failure(let error):
                    if let strongSelf = self {
                        if ((self?.viewModel.items.isEmpty) != nil) {
                         //   self?.showFailedFetchView()
                        }
                        guard let restError = error as? SwiftyRestKitError,
                              !(restError == .resourceNotFound && strongSelf.viewModel.hasReachedLastPage) else {
                            return
                        }
                        ErrorHandler.sharedInstance.handleError(error, from: strongSelf)
                    }
                }
            }
        }
    }
}

extension UIStackView {
    func addArrangedSubViews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
