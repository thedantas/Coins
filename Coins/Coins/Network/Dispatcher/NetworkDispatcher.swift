//
//  NetworkDispatcher.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 01/11/22.
//

import Foundation

public typealias NetworkDispatcherCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()
protocol NetworkDispatcher: AnyObject {
    associatedtype EndPoint: EndPointType    
    func request(_ route: EndPoint, completion: @escaping NetworkDispatcherCompletion)
    func cancel()
}
