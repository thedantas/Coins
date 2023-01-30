//
//  Service.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 01/11/22.
//


import Foundation

public protocol Service {
    associatedtype EndPoint: EndPointType
}

extension Service {
    public var manager: NetworkManager<EndPoint> {
        return NetworkManager<EndPoint>()
    }
    
}
