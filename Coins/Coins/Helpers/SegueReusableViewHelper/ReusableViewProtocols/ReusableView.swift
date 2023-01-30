//
//  ReusableView.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    
    public static var reuseIdentifier: String {
        return String.init(describing: self)
    }
}
