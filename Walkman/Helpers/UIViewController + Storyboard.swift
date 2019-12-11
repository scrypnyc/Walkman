//
//  UIViewController + Storyboard.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 11.12.2019.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: no initial viewController in \(name) storyboard")
        }
    }
}
