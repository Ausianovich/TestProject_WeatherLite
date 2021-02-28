//
//  DayForecastViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 27.02.2021.
//

import UIKit

class DayForecastViewController: UIViewController {
    var cityName: String = "NewCity"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setSubviews()
        self.activateConstraints()
    }
    
    func setCity(name: String) {
        self.cityName = name
        self.navigationItem.title = self.cityName
    }
    
    private func setSubviews() {
        self.view.addSubviews(self.mainContainerView)
        
        self.mainContainerView.addSubviews(self.mainWeatherInformerView, self.additionalWeatherInformerView, self.buttonContainerView)
        
        
        self.mainWeatherInformerView.addSubviews(self.weatherImage,self.locationLabel, self.weatherDataLabel)
        self.additionalWeatherInformerView.addSubviews(self.firstRowInformerDetailsContainer, self.secondRowInformerDetailsContainer)
        self.buttonContainerView.addSubviews(self.shareButton)
        
        self.firstRowInformerDetailsContainer.addSubviews(self.humidityContainer, self.rainContainer, self.pressureContainer)
        self.secondRowInformerDetailsContainer.addSubviews(self.windSpeedContainer, self.windDirectionContainer)
        
        self.humidityContainer.addSubviews(self.humidityUIImage, self.humidityLabel)
        self.rainContainer.addSubviews(self.rainUIImage, self.rainLabel)
        self.pressureContainer.addSubviews(self.pressureUIImage, self.pressureLabel)
        self.windSpeedContainer.addSubviews(self.windSpeedUIImage, self.windSpeedLabel)
        self.windDirectionContainer.addSubviews(self.windDirectionUIImage, self.windDirectionLabel)
        
    }
    
    private func activateConstraints() {
        
        NSLayoutConstraint.activate([
            self.mainContainerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.mainContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.mainContainerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.mainContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.mainWeatherInformerView.topAnchor.constraint(equalTo: self.mainContainerView.safeAreaLayoutGuide.topAnchor),
            self.mainWeatherInformerView.leadingAnchor.constraint(equalTo: self.mainContainerView.leadingAnchor),
            self.mainWeatherInformerView.trailingAnchor.constraint(equalTo: self.mainContainerView.trailingAnchor),
            self.mainWeatherInformerView.heightAnchor.constraint(equalTo: self.mainContainerView.heightAnchor, multiplier: 0.5, constant: 0),
            
            self.additionalWeatherInformerView.topAnchor.constraint(equalTo: self.mainWeatherInformerView.bottomAnchor),
            self.additionalWeatherInformerView.leadingAnchor.constraint(equalTo: self.mainContainerView.leadingAnchor),
            self.additionalWeatherInformerView.trailingAnchor.constraint(equalTo: self.mainContainerView.trailingAnchor),
            self.additionalWeatherInformerView.heightAnchor.constraint(equalTo: self.mainContainerView.heightAnchor, multiplier: 0.35, constant: 0),

            self.buttonContainerView.topAnchor.constraint(equalTo: self.additionalWeatherInformerView.bottomAnchor),
            self.buttonContainerView.leadingAnchor.constraint(equalTo: self.mainContainerView.leadingAnchor),
            self.buttonContainerView.trailingAnchor.constraint(equalTo: self.mainContainerView.trailingAnchor),
            self.buttonContainerView.bottomAnchor.constraint(equalTo: self.mainContainerView.bottomAnchor),

            self.weatherImage.centerXAnchor.constraint(equalTo: self.mainWeatherInformerView.centerXAnchor),
            self.weatherImage.centerYAnchor.constraint(equalTo: self.mainWeatherInformerView.centerYAnchor),
            
            self.locationLabel.topAnchor.constraint(equalTo: self.weatherImage.bottomAnchor),
            self.locationLabel.centerXAnchor.constraint(equalTo: self.mainWeatherInformerView.centerXAnchor),

            self.weatherDataLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor),
            self.weatherDataLabel.centerXAnchor.constraint(equalTo: self.mainWeatherInformerView.centerXAnchor),
            
            self.firstRowInformerDetailsContainer.topAnchor.constraint(equalTo: self.additionalWeatherInformerView.topAnchor),
            self.firstRowInformerDetailsContainer.leadingAnchor.constraint(equalTo: self.additionalWeatherInformerView.leadingAnchor),
            self.firstRowInformerDetailsContainer.trailingAnchor.constraint(equalTo: self.additionalWeatherInformerView.trailingAnchor),
            
            self.secondRowInformerDetailsContainer.topAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.bottomAnchor),
            self.secondRowInformerDetailsContainer.leadingAnchor.constraint(equalTo: self.additionalWeatherInformerView.leadingAnchor),
            self.secondRowInformerDetailsContainer.bottomAnchor.constraint(equalTo: self.additionalWeatherInformerView.bottomAnchor),
            self.secondRowInformerDetailsContainer.trailingAnchor.constraint(equalTo: self.additionalWeatherInformerView.trailingAnchor),
            self.secondRowInformerDetailsContainer.heightAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.heightAnchor),
            
            self.humidityContainer.topAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.topAnchor),
            self.humidityContainer.bottomAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.bottomAnchor),
            self.humidityContainer.leadingAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.leadingAnchor),
            
            self.rainContainer.topAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.topAnchor),
            self.rainContainer.leadingAnchor.constraint(equalTo: self.humidityContainer.trailingAnchor),
            self.rainContainer.bottomAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.bottomAnchor),
            self.rainContainer.widthAnchor.constraint(equalTo: self.humidityContainer.widthAnchor),
            
            self.pressureContainer.topAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.topAnchor),
            self.pressureContainer.leadingAnchor.constraint(equalTo: self.rainContainer.trailingAnchor),
            self.pressureContainer.bottomAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.bottomAnchor),
            self.pressureContainer.trailingAnchor.constraint(equalTo: self.firstRowInformerDetailsContainer.trailingAnchor),
            self.pressureContainer.widthAnchor.constraint(equalTo: self.humidityContainer.widthAnchor),
            
            self.windSpeedContainer.topAnchor.constraint(equalTo: self.secondRowInformerDetailsContainer.topAnchor),
            self.windSpeedContainer.leadingAnchor.constraint(equalTo: self.secondRowInformerDetailsContainer.leadingAnchor),
            self.windSpeedContainer.bottomAnchor.constraint(equalTo: self.secondRowInformerDetailsContainer.bottomAnchor),
            
            self.windDirectionContainer.topAnchor.constraint(equalTo: self.secondRowInformerDetailsContainer.topAnchor),
            self.windDirectionContainer.leadingAnchor.constraint(equalTo: self.windSpeedContainer.trailingAnchor),
            self.windDirectionContainer.bottomAnchor.constraint(equalTo: self.secondRowInformerDetailsContainer.bottomAnchor),
            self.windDirectionContainer.trailingAnchor.constraint(equalTo: self.secondRowInformerDetailsContainer.trailingAnchor),
            self.windDirectionContainer.widthAnchor.constraint(equalTo: self.windSpeedContainer.widthAnchor),
            
            self.humidityUIImage.centerYAnchor.constraint(equalTo: self.humidityContainer.centerYAnchor),
            self.humidityUIImage.centerXAnchor.constraint(equalTo: self.humidityContainer.centerXAnchor),
            self.humidityLabel.centerXAnchor.constraint(equalTo: self.humidityContainer.centerXAnchor),
            self.humidityLabel.topAnchor.constraint(equalTo: self.humidityUIImage.bottomAnchor),
            
            self.rainUIImage.centerYAnchor.constraint(equalTo: self.rainContainer.centerYAnchor),
            self.rainUIImage.centerXAnchor.constraint(equalTo: self.rainContainer.centerXAnchor),
            self.rainLabel.centerXAnchor.constraint(equalTo: self.rainContainer.centerXAnchor),
            self.rainLabel.topAnchor.constraint(equalTo: self.rainUIImage.bottomAnchor),
            
            self.pressureUIImage.centerYAnchor.constraint(equalTo: self.pressureContainer.centerYAnchor),
            self.pressureUIImage.centerXAnchor.constraint(equalTo: self.pressureContainer.centerXAnchor),
            self.pressureLabel.centerXAnchor.constraint(equalTo: self.pressureContainer.centerXAnchor),
            self.pressureLabel.topAnchor.constraint(equalTo: self.pressureUIImage.bottomAnchor),
            
            self.windSpeedUIImage.centerYAnchor.constraint(equalTo: self.windSpeedContainer.centerYAnchor),
            self.windSpeedUIImage.centerXAnchor.constraint(equalTo: self.windSpeedContainer.centerXAnchor),
            self.windSpeedLabel.centerXAnchor.constraint(equalTo: self.windSpeedContainer.centerXAnchor),
            self.windSpeedLabel.topAnchor.constraint(equalTo: self.windSpeedUIImage.bottomAnchor),
            
            self.windDirectionUIImage.centerYAnchor.constraint(equalTo: self.windDirectionContainer.centerYAnchor),
            self.windDirectionUIImage.centerXAnchor.constraint(equalTo: self.windDirectionContainer.centerXAnchor),
            self.windDirectionLabel.centerXAnchor.constraint(equalTo: self.windDirectionContainer.centerXAnchor),
            self.windDirectionLabel.topAnchor.constraint(equalTo: self.windDirectionUIImage.bottomAnchor),
            
            
            self.shareButton.centerXAnchor.constraint(equalTo: self.buttonContainerView.centerXAnchor),
            self.shareButton.centerYAnchor.constraint(equalTo: self.buttonContainerView.centerYAnchor)
        ])
    }
    
    //Main level
    lazy var mainContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Blocks level
    lazy var mainWeatherInformerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var additionalWeatherInformerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonContainerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MainWeatherInformedView Details level
    lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var locationLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: UIFontDescriptor(), size: 30)
        return label
    }()
    
    
    // ButtonContainerView Details level
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc
    func shareButtonPressed(sender: UIButton!) {
        print("Button is pressed")
    }
    
    //AdditionalWeatherInformerView Container Level
    
    lazy var firstRowInformerDetailsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondRowInformerDetailsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //AdditionalWeatherInformerView Containers Level two
    
    lazy var humidityContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var rainContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var pressureContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var windSpeedContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var windDirectionContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //AdditionalWeatherInformerView Containers Level three
    
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humidityUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "humidity")
        return image
    }()
    
    lazy var rainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rainUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "rain")
        return image
    }()
    
    lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pressureUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pressure")
        return image
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var windSpeedUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "windSpeed")
        return image
    }()
    
    lazy var windDirectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var windDirectionUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "windDirection")
        return image
    }()
    

}
