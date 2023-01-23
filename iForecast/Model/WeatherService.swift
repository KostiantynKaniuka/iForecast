//
//  WeatherService.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 23.01.2023.
//

import Foundation
import CoreLocation

protocol WeatherServiceDelegate: AnyObject {
    func didFetchWeather(_ weatherService: WeatherService, _ weather: WeatherModel)
}

struct WeatherService {
    weak var delegate: WeatherServiceDelegate?
        
    func fetchWeather(cityName: String) {
        let weatherModel = WeatherModel(conditionId: 700, cityName: cityName, temperature: -10)
        delegate?.didFetchWeather(self, weatherModel)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let weatherModel = WeatherModel(conditionId: 800, cityName: "Paris", temperature: 25)
        delegate?.didFetchWeather(self, weatherModel)
    }
}
