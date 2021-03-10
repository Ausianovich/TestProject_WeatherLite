//
//  ViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

final class MainTabBarController: UITabBarController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    func setupTabBar() {
        let dayForecastViewController = DayForecastViewController()
        let hourlyForecastViewController = HourlyForecastViewController()
        dayForecastViewController.hourlyForecastController = hourlyForecastViewController

        
        
        let dayForecastNavigationController = self.createNavigationController(with: dayForecastViewController,
                                                                        title: "Today",
                                                                        selected: UIImage(systemName: "sun.min"),
                                                                        unselected: UIImage(systemName: "sun.min.fill"))
        let hourlyForecastNavigationController = self.createNavigationController(with: hourlyForecastViewController,
                                                                           title: "Forecast",
                                                                           selected: UIImage(systemName: "cloud.fog"),
                                                                           unselected: UIImage(systemName: "cloud.fog.fill"))
        
        dayForecastNavigationController.navigationController?.title = "Today"
        hourlyForecastNavigationController.navigationController?.title = "Forecast"
        self.viewControllers = [dayForecastNavigationController, hourlyForecastNavigationController]
    }
}
