//
//  LocationArea.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit
import CoreLocation

final class iForeCastViewController: UIViewController {
    
    private let topImageView = UIImageView()
    private let cityNameTextField = UITextField()
    private let locationButton = UIButton()
    private let locationManager = CLLocationManager()
    var weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
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
        topImageView.image = UIImage(named: "Locator")
        
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
    
    //MARK: - Layout
    private func layout() {
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        cityNameTextField.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topImageView)
        view.addSubview(cityNameTextField)
        view.addSubview(locationButton)
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cityNameTextField.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 7),
            cityNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameTextField.widthAnchor.constraint(equalToConstant: 260),
            cityNameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            locationButton.topAnchor.constraint(equalTo: cityNameTextField.bottomAnchor, constant: 12),
            locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationButton.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
}

//MARK: - Weather Manager
extension iForeCastViewController: WeatherServiceDelegate {
    
    func didFetchWeather(_ weatherService: WeatherService, _ weather: WeatherModel) {
           updateUI(with: weather)
       }
    
    private func updateUI(with weatherModel: WeatherModel) {
//           temperatureLabel.attributedText = makeTemperatureText(with: weatherModel.temperatureString)
//           conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
           cityNameTextField.text = weatherModel.cityName
       }
}

//MARK: - Location Delegate
extension iForeCastViewController: CLLocationManagerDelegate {
    
    @objc func locationPressed(_ sender: UIButton) {
          locationManager.requestLocation()
      }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            print("lat: \(lat) long: \(long)")
            // weatherService.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print(error)
       }
}

//MARK: - CityName text field delegate
extension iForeCastViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityNameTextField.endEditing(true)
        return true
    }
    
}


//MARK: - Actions
extension iForeCastViewController {
    
    @objc func locationServicesActivation(sender: UIButton) {
        for _ in 1...10 {
            animateLocationIcon(duration: 5)
        }
    }
    
    //animation
    private func animateLocationIcon(duration: Double) {
        UIView.animate(withDuration: duration) {
            self.topImageView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseIn
        ) {
            self.topImageView.transform = CGAffineTransform(rotationAngle: 2 * .pi)
        }
    }
    
}
