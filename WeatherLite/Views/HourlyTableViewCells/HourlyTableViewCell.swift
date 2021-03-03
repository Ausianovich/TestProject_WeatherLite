//
//  HourlyTableViewCell.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    //MARK: - Properties
    
    lazy var mainContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var timeCode: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherCondition: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperature: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Main methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setSubviews() {
        self.contentView.addSubview(self.mainContainerView)
        self.textContainerView.addSubviews(self.timeCode, self.weatherCondition)
        self.mainContainerView.addSubviews(self.weatherImage, self.textContainerView, self.temperature)
        self.activateConstraints()
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            self.mainContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.mainContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            self.mainContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.mainContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            self.weatherImage.topAnchor.constraint(equalTo: self.mainContainerView.topAnchor),
            self.weatherImage.leadingAnchor.constraint(equalTo: self.mainContainerView.leadingAnchor),
            self.weatherImage.bottomAnchor.constraint(equalTo: self.mainContainerView.bottomAnchor),
            self.weatherImage.widthAnchor.constraint(equalTo: self.weatherImage.heightAnchor),
            
            self.textContainerView.topAnchor.constraint(equalTo: self.mainContainerView.topAnchor, constant: 20),
            self.textContainerView.leadingAnchor.constraint(equalTo: self.weatherImage.trailingAnchor, constant: 10),
            self.textContainerView.bottomAnchor.constraint(equalTo: self.mainContainerView.bottomAnchor, constant: -20),
            
            self.timeCode.topAnchor.constraint(equalTo: self.textContainerView.topAnchor),
            self.timeCode.leadingAnchor.constraint(equalTo: self.textContainerView.leadingAnchor),
            
            self.weatherCondition.topAnchor.constraint(equalTo: self.timeCode.bottomAnchor, constant: 10),
            self.weatherCondition.leadingAnchor.constraint(equalTo: self.textContainerView.leadingAnchor),
            self.weatherCondition.bottomAnchor.constraint(equalTo: self.textContainerView.bottomAnchor),
            
            self.temperature.topAnchor.constraint(equalTo: self.mainContainerView.topAnchor, constant: 5),
            self.temperature.bottomAnchor.constraint(equalTo: self.mainContainerView.bottomAnchor, constant: -5),
            self.temperature.trailingAnchor.constraint(equalTo: self.mainContainerView.trailingAnchor, constant: -30)
        ])
    }
    
    func configure(with viewModel: HourlyTableViewCellModel) {
        self.weatherImage.image = viewModel.image
        self.timeCode.text = viewModel.timeCode
        self.weatherCondition.text = viewModel.weatherCondition
        self.temperature.text = viewModel.temperature
    }
}
