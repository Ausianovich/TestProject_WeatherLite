//
//  HourlyForecastViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

struct Section {
    var title: String
    var data: [HourlyTableViewCellModel]
}


class HourlyForecastViewController: UIViewController {
    
    let testData: [Section] = [
        Section(title: "Moday",
                data: [
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "11.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "12.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "13.0")]),
                               
        Section(title: "Tuesday",
                data: [
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "21.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "22.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "23.0")]),
        Section(title: "Wensday",
                data: [
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "21.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "22.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "23.0")]),
                        
        Section(title: "Thursday",
                data: [
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "21.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "22.0"),
                    HourlyTableViewCellModel(image: UIImage(systemName: "sun.max"), timeCode: "12-00", weatherCondition: "Well", temperature: "23.0")])
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupNavigationItemTitle()
        self.setTableViewDataSource()
        self.removeEmptyTableViewCells()
        
        self.tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "sectionCell")
        self.tableView.register(HourlyTableViewCell.self, forCellReuseIdentifier: "weatherCell")
        
        self.setupSubviews()
    }
    
    private func setupNavigationItemTitle() {
        self.navigationItem.title = "My city"
    }
    
    private func setTableViewDataSource () {
        self.tableView.dataSource = self
    }
    
    private func removeEmptyTableViewCells() {
        self.tableView.tableFooterView = UIView()
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
    
}

extension HourlyForecastViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.testData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testData[section].data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let section = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as? SectionTableViewCell else {return UITableViewCell()}
            section.configure(with: self.testData[indexPath.section].title)
            return section
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? HourlyTableViewCell else {return UITableViewCell()}
            let weatherModel = self.testData[indexPath.section].data[indexPath.row - 1]
            cell.configure(with: weatherModel)
            return cell
        }
    }
}
