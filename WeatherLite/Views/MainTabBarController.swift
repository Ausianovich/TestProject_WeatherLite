//
//  ViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    func setupTabBar() {
        let dayForecastViewController = self.createNavigationController(with: DayForecastViewController(),
                                                                        selected: UIImage(systemName: "sun.min"),
                                                                        unselected: UIImage(systemName: "sun.min.fill"))
        let hourlyForecastViewController = self.createNavigationController(with: HourlyForecastViewController(),
                                                                           selected: UIImage(systemName: "cloud.fog"),
                                                                           unselected: UIImage(systemName: "cloud.fog.fill"))
        self.viewControllers = [dayForecastViewController, hourlyForecastViewController]
    }
}
