//
//  AppCoodinator.swift
//  Coins
//
//  Created by André  Costa Dantas on 25/01/23.
//

import Foundation
import UIKit
import Swinject

class AppCoordinator: Coordinator {
    
    //MARK: Variables
    let window: UIWindow
    let container: Container

    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionFlipFromTop, animations: {
                let navViewController = UINavigationController(rootViewController: newValue!)
                self.window.rootViewController = navViewController
            }, completion: nil)
        }
    }
    
    //MARK: Init
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }
    
    //MARK: Functions
    func start() {
            showSplashScreen()
    }
    
    fileprivate func showSplashScreen() {
        let view = container.resolve(SplashViewController.self)!
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showMainView() {
        let view = container.resolve(ListViewController.self)!
        self.currentView = view
    }

}

//MARK: Extentions
extension AppCoordinator: SplashDelegate {
    func navigateToMain() {
        self.showMainView()
    }

}
