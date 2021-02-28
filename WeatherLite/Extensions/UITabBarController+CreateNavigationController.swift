//
//  UITabBarController+CreateNavigationController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

extension UITabBarController {
    func createNavigationController(with viewController: UIViewController, title: String, selected: UIImage?, unselected: UIImage?) -> UINavigationController {
        let viewController = viewController
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.tabBarItem.image = unselected
        navigationViewController.tabBarItem.selectedImage = selected
        navigationViewController.title = title
        return navigationViewController
    }
}
