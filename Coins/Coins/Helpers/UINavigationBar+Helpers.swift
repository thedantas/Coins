//
//  UINavigationBar+Helpers.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation
import UIKit

extension UINavigationBar {
    func setPrimaryLargeTitleAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .heavyOrangeColor
        standardAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
    }
}
extension UIViewController {

    func setBackButton() {
        let yourBackImage = UIImage(named: "backImage")
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }

}
