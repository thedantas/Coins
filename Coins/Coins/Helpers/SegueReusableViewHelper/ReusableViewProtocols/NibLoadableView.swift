//
//  NibLoadableView.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation
import UIKit

public protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {
    public static var NibName: String {
        return String(describing: self)
    }
}
