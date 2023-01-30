//
//  MatchListViewModel.swift
//  Coins
//
//  Created by André  Costa Dantas on 23/01/23.
//

import Foundation

class CryptoListViewModel: ListViewModel {
    typealias Model = Crypto
    // MARK: - Properties
    private let service: Gettable?
    private(set) var items = [Crypto]()
    private(set) var hasReachedLastPage: Bool = false
    // MARK: - Init
    init<S: Gettable>(service: S) {
        self.service = service
    }
    // MARK: - ListViewModel Conformance
    func addItems(_ items: [Model]) {
        self.items.append(contentsOf: items)
    }
    func removeAllItems() {
        items.removeAll()
    }
    // MARK: - Fetch data
    func fetchShows(completion: @escaping (Result<Bool>) -> Void) {
        guard let service = service as? Services else {
            completion(.Failure(SwiftyRestKitError.serviceError))
            return
        }
        service.fetchAllMatchs { [weak self] (result) in
            switch result {
            case .Success(let shows):
                self?.addItems(shows)
                completion(.Success(true))
            case .Failure(let error):
                if let restError = error as? SwiftyRestKitError, restError == .resourceNotFound {
                    self?.hasReachedLastPage = true
                }
                completion(.Failure(error))
            }
        }
    }

}
