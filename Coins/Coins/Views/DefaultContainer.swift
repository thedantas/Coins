//
//  DefaultContainer.swift
//  Coins
//
//  Created by André  Costa Dantas on 25/01/23.
//

import Foundation
import Swinject

final class DefaultContainer {
    let container: Container
    init() {
        self.container = Container()
        self.registerViews()
    }
}

extension DefaultContainer {
    func registerViews() {

        self.container.register(ListViewController.self) { _ in
            ListViewController()
        }
        self.container.register(SplashViewController.self) { _ in
            SplashViewController()
        }
    }    
}
