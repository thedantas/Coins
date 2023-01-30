//
//  StoryboardIDHandlerType.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import UIKit
import Foundation


public protocol StoryboardIDHandlerType { }

extension StoryboardIDHandlerType where Self: UIViewController {
    
    public static var storyboardID: String {
        return String.init(describing: self)
    }
}
