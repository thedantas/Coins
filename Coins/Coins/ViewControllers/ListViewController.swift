//
//  ViewController.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

import UIKit

// MARK: - Protocol Splash
protocol ListDelegate: AnyObject {
    func navigateToDetail()
}

class ListViewController: UIViewController {
    // MARK: - Varibles
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.tintColor = .white
        return activityIndicator
    }()
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView.init(frame: .zero)
        return tableView
    }()
    var failedFetchView: FailedView = {
        let view = FailedView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - Properties
    private var datasource: TableViewDataSource<ListTableViewCell, CryptoListViewModel>!
    private let viewModel = CryptoListViewModel(service: Services())
    weak var delegate: ListDelegate?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        failedFetchView.delegate = self
        tableView.dataSource = datasource
        tableView.delegate = self
        getData()
    }
    // MARK: - Layout
    func setupLayout() {
        title = "Main Title".localized()
        navigationController?.navigationBar.setPrimaryLargeTitleAppearance()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.addSubview(activityIndicator)
        view.addSubview(failedFetchView)
        let safeG = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 0.0),
            tableView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 0.0),
            tableView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: 0.0),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0),
            failedFetchView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            failedFetchView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0),
            failedFetchView.heightAnchor.constraint(equalToConstant: 150.0),
            failedFetchView.widthAnchor.constraint(equalToConstant: 200.0)
        ])
        datasource = TableViewDataSource<ListTableViewCell,
                                         CryptoListViewModel>(viewModel: viewModel,
                                                              tableView: tableView) { cell, model in
            let cellViewModel = CoinsListTableViewCellViewModel(model: model)
            cell.update(with: cellViewModel)
        }
    }
    // MARK: - Data Fetch
    func getData() {
        activityIndicator.startAnimating()
        viewModel.fetchShows { [weak self] (result) in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                switch result {
                case .Success:
                    self?.tableView.reloadData()
                case.Failure(let error):
                    if let strongSelf = self {
                        if let restError = error as? SwiftyRestKitError, restError == .invalidAPIClientKey {
                            ErrorHandler.sharedInstance.handleError(error, from: self!)
                        }
                        if ((self?.viewModel.items.isEmpty) != nil) {
                            self?.showFailedFetchView()
                        }
                        guard let restError = error as? SwiftyRestKitError, !(restError == .resourceNotFound && strongSelf.viewModel.hasReachedLastPage) else {
                            return
                        }
                        ErrorHandler.sharedInstance.handleError(error, from: strongSelf)
                    }
                }
            }
        }
    }
    // MARK: - Helper Methods
    fileprivate func showFailedFetchView() {
        tableView.isHidden = true
        failedFetchView.isHidden = false
    }
    fileprivate func hideFailedFetchView() {
        tableView.isHidden = false
        activityIndicator.startAnimating()
    }
}

// MARK: - ListViewControllerViewControllerDelegate
extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !viewModel.hasReachedLastPage {
            if indexPath.item == viewModel.items.count - 1 {
                getData()
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.cypto = datasource.viewModel.items[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: false)
    }
}

// MARK: - Failed Protocol
extension ListViewController : FailedViewProtocol {
    func retryAction() {
        getData()
    }
}
