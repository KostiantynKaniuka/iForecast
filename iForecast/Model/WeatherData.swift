//
//  WeatherData.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 23.01.2023.
//

import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Main: Codable {
    let temp: Double
}
