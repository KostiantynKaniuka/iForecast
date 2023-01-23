//
//  iForeCastViewController.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit
import CoreLocation

final class iForeCastViewController: UIViewController {
    
    private let locationImageView = UIImageView()
    private let cityNameTextField = UITextField()
    private let locationButton = UIButton()
    private let conditionImageView = UIImageView()
    private let locationManager = CLLocationManager()
    private let temperatureLabel = UILabel()
    private let celsiusSymbolLabel = UILabel()
    private let environmentLabel = UILabel()
    private let topStackView = UIStackView()
    private let backgroundView = Gradient()
    var weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherService.delegate = self
    }
}

extension iForeCastViewController {
    //MARK: - Setup
    private func setup() {
        locationButton.addTarget(self, action: #selector(locationServicesActivation), for: .primaryActionTriggered)
        locationButton.addTarget(self, action: #selector(locationPressed), for: .primaryActionTriggered)
        cityNameTextField.delegate = self
    }
    
    //MARK: - Style
    private func style() {
        locationImageView.image = UIImage(named: "Locator")
        conditionImageView.image = UIImage(systemName: "cloud")
        conditionImageView.tintColor = .white
        //StackView
        topStackView.axis = .vertical
        topStackView.alignment = .fill
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 20
        //TextField
        cityNameTextField.backgroundColor = UIColor.init(white: 0.3, alpha: 0.4)
        cityNameTextField.textColor = .white
        cityNameTextField.layer.cornerRadius = 10
        cityNameTextField.layer.borderWidth = 1
        cityNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        cityNameTextField.font = UIFont(name: "Cabin-Bold", size: 17)
        cityNameTextField.attributedPlaceholder = NSAttributedString(string: "Enter location here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cityNameTextField.setLeftPaddingPoints(10)
        cityNameTextField.textAlignment = .center
        cityNameTextField.layer.shadowRadius = 3.0
        //CelsiusLabel
        celsiusSymbolLabel.text = "°C"
        celsiusSymbolLabel.font = UIFont(name: "Cabin-Bold", size: 50)
        celsiusSymbolLabel.numberOfLines = 0
        celsiusSymbolLabel.textAlignment = .center
        celsiusSymbolLabel.textColor = .white
        //EnvironmentLabel
        environmentLabel.text = "Cloudy"
        environmentLabel.font = UIFont(name: "Cabin-Bold", size: 40)
        environmentLabel.numberOfLines = 0
        environmentLabel.textAlignment = .center
        environmentLabel.textColor = .white
        
        //Button
        let attributedText = NSMutableAttributedString(string: "Get Forecast", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
        ])
        var config = UIButton.Configuration.filled()
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        config.baseBackgroundColor = .yellowButton
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        locationButton.configuration = config
        locationButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    private func makeTemperatureText(with temperature: String) -> NSAttributedString {
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 161)
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        return text
    }
    
    //MARK: - Layout
    private func layout() {
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        celsiusSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        environmentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.add(subviews: backgroundView,
                 locationImageView,
                 topStackView,
                 temperatureLabel,
                 celsiusSymbolLabel,
                 environmentLabel,
                 conditionImageView)
        
        topStackView.addArrangedSubview(cityNameTextField)
        topStackView.addArrangedSubview(locationButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            locationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: locationImageView.bottomAnchor, constant: 8),
            topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            celsiusSymbolLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 32),
            celsiusSymbolLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
            
            temperatureLabel.heightAnchor.constraint(equalToConstant: 150),
            temperatureLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 32),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            environmentLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            environmentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conditionImageView.topAnchor.constraint(equalTo: environmentLabel.bottomAnchor, constant: 32),
            conditionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cityNameTextField.widthAnchor.constraint(equalToConstant: 260),
            cityNameTextField.heightAnchor.constraint(equalToConstant: 30),
            locationButton.widthAnchor.constraint(equalToConstant: 260),
            conditionImageView.heightAnchor.constraint(equalToConstant: 180),
            conditionImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

//MARK: - Weather Manager
extension iForeCastViewController: WeatherServiceDelegate {
    
    func didFetchWeather(_ weatherService: WeatherService, _ weather: WeatherModel) {
        updateUI(with: weather)
    }
    
    private func updateUI(with weatherModel: WeatherModel) {
        temperatureLabel.attributedText = makeTemperatureText(with: weatherModel.temperatureString)
        conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
        cityNameTextField.text = weatherModel.cityName
        environmentLabel.text = weatherModel.enviromentName
    }
}

//MARK: - Location Delegate
extension iForeCastViewController: CLLocationManagerDelegate {
    
    @objc func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
        weatherService.fetchWeather(cityName: cityNameTextField.text ?? "")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            print("lat: \(lat) long: \(long)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

//MARK: -TextField Delegate
extension iForeCastViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if cityNameTextField.text == "" {
            locationButton.isEnabled = false
        } else {
            locationButton.isEnabled = true
        }
        cityNameTextField.endEditing(true)
        return true
    }
}

//MARK: - Actions
extension iForeCastViewController {
    
    @objc func locationServicesActivation(sender: UIButton) {
            animateLocationIcon(duration: 1)
    }
    
    //animation
    private func animateLocationIcon(duration: Double) {
        UIView.animate(withDuration: duration) {
            self.locationImageView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseIn
        ) {
            self.locationImageView.transform = CGAffineTransform(rotationAngle: 2 * .pi)
        }
    }
}
