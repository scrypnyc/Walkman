//
//  MainTabBarController.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 18.11.2019.
//  Copyright © 2019 Alexander Skrypnyk. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 0.8949977756, green: 0.3182727098, blue: 0.01125960331, alpha: 1)
        
        viewControllers = [generateViewController(rootViewController: SearchLibraryViewController(), image: #imageLiteral(resourceName: "ios10-apple-music-search-5nav-icon"), title: "Library Search"), generateViewController(rootViewController: ViewController(), image: #imageLiteral(resourceName: "ios10-apple-music-library-5nav-icon"), title: "Library")]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
    
}
