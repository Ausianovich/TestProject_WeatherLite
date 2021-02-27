//
//  DayForecastViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

class DayForecastViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Today"
        self.navigationController?.title = "Today"
    }
}
