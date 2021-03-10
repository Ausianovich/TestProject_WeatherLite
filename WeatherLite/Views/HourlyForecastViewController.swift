//
//  HourlyForecastViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

final class HourlyForecastViewController: UIViewController {
    
    //MARK: - Properties
    private var cityName: String = ""
    private var testData: [HourlyTableViewSectionCellModel] = []
    private var presenter: HourlyWeatherPresenterProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setTableViewDataSource()
        self.setupNavigation(itemTitle: "loading...")
        self.removeEmptyTableViewCells()
        self.registerCellsInTableView()
        self.setupSubviews()
        
        let presenter = HourlyForecastPresenter(delegate: self)
        self.set(presenter: presenter)
        self.updateData()
    }
    
    //MARK: - Helpers
    private func setTableViewDataSource () {
        self.tableView.dataSource = self
    }
    
    private func setupNavigation(itemTitle: String) {
        self.navigationItem.title = itemTitle
    }
    
    private func removeEmptyTableViewCells() {
        self.tableView.tableFooterView = UIView()
    }
    
    private func registerCellsInTableView() {
        self.tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: String(describing: SectionTableViewCell.self))
        self.tableView.register(HourlyTableViewCell.self, forCellReuseIdentifier: String(describing: HourlyTableViewCell.self))
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.tableView)
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func set(presenter: HourlyWeatherPresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateData() {
        self.presenter?.fetchCurrentPositionWeather()
    }
    
    func updayteData(with cityName: String) {
        self.presenter?.fetchWeather(with: cityName)
    }
}

//MARK: - Extention: HourlyForecastViewDelegate
extension HourlyForecastViewController: HourlyForecastViewDelegate {
    func updateHourlyForecastViewController(with model: HourlyWeatherDTO) {
        self.setupNavigation(itemTitle: model.locationName)
        let hourlyData = model.hourlyData
        
        let sections = hourlyData.map { section -> HourlyTableViewSectionCellModel in
            let hourlyData = section.hourlyData.map { cellModel in
                    HourlyTableViewCellModel(image: UIImage(named: cellModel.weatherCondition ?? ""),
                                             timeCode: cellModel.timeCode ?? "",
                                             weatherCondition: cellModel.weatherDescription?.capitalized ?? "",
                                             temperature: (cellModel.temperature ?? "") + "°")
            }
            return HourlyTableViewSectionCellModel(title: section.dayOfWeek, data: hourlyData)
        }
        
        self.testData = sections
        self.tableView.reloadData()
    }
    
    func show(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

//MARK: - Extension: UITableViewDataSource
extension HourlyForecastViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.testData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testData[section].data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let section = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionTableViewCell.self)) as? SectionTableViewCell else {return UITableViewCell()}
            section.configure(with: self.testData[indexPath.section].title)
            return section
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HourlyTableViewCell.self)) as? HourlyTableViewCell else {return UITableViewCell()}
            let weatherModel = self.testData[indexPath.section].data[indexPath.row - 1]
            cell.configure(with: weatherModel)
            return cell
        }
    }
}
