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
    let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=1fb28699574c10cef2caafcbea3d4929&units=metric")!
    
    
    func fetchWeather(cityName: String) {
        let stringURL = "\(weatherURL)&q=\(cityName)"
        performRequest(with: stringURL)
    }
    
    func performRequest(with urlString: String) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let safeData = data {
                if let weather = self.parseJSON(safeData) {
                    DispatchQueue.main.async {
                        self.delegate?.didFetchWeather(self, weather)
                    }
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
            let decodedData = try! JSONDecoder().decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather }
}
