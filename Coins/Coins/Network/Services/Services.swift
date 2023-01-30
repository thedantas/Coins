//
//  Services.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation

struct Services {
    
    func fetchAllMatchs(page: Int, completion: @escaping (Result<[Crypto]>) -> Void) {
        manager.dispatcher.request(.allMatchs(page: page)) { (data, response, error) in
            if let error = error {
                let networkError = ErrorHandler.sharedInstance.convertNSURLError(error)
                completion(Result.Failure(networkError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(Result.Failure(SwiftyRestKitError.decodingFailed))
                return
            }
            
            let result = self.manager.handleNetworkResponse(response)
            
            switch result {
            case .Success:
                guard let data = data else { return }
                let decoder = JSONDecoder()
                if let showsData = try? decoder.decode([Crypto].self, from: data) {
                    completion(Result.Success(showsData))
                } else {
                    completion(Result.Failure(SwiftyRestKitError.resourceNotFound))
                }
                
            case .Failure(let error):
                if let _ = error as? NetworkManager<CoinsAPI>.NetworkResponse {
                    completion(Result.Failure(SwiftyRestKitError.resourceNotFound))
                }
                completion(Result.Failure(error))
            }
        }
    }
    
    func fetchTeam(teamID: String, completion: @escaping (Result<DetailCrypto>) -> Void) {
        manager.dispatcher.request(.showDetails(matchID: teamID)) { (data, response, error) in
            if let error = error {
                let networkError = ErrorHandler.sharedInstance.convertNSURLError(error)
                completion(Result.Failure(networkError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(Result.Failure(SwiftyRestKitError.decodingFailed))
                return
            }
            
            let result = self.manager.handleNetworkResponse(response)
            
            switch result {
            case .Success:
                guard let data = data else { return }
                let str = String(decoding: data, as: UTF8.self)
                print(str)
                let decoder = JSONDecoder()
                if let showsData = try? decoder.decode(DetailCrypto.self, from: data) {
                    completion(Result.Success(showsData))
                } else {
                    completion(Result.Failure(SwiftyRestKitError.resourceNotFound))
                }
                
            case .Failure(let error):
                if let _ = error as? NetworkManager<CoinsAPI>.NetworkResponse {
                    completion(Result.Failure(SwiftyRestKitError.resourceNotFound))
                }
                completion(Result.Failure(error))
            }
        }
    }
}

extension Services: Service {
    typealias EndPoint = CoinsAPI
}

extension Services: Gettable { }

