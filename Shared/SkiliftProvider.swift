//
//  SkiliftProvider.swift
//  TibberExpress (iOS)
//
//  Created by Bror Brurberg on 05/11/2021.
//

import Foundation

class SkiliftProvider: ObservableObject {
    @Published var weatherStations: [WeatherStation] = []
    @Published var cameras: [Camera] = []
    
    func fetchCameras() async throws -> Void {
        let url = URL(string: "https://oppdal-skisenter.herokuapp.com/v1/cameras")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        DispatchQueue.main.async {
            self.cameras = try! decoder.decode([Camera].self, from: data)
        }
    }
    
    func fetchWeatherData() async throws -> Void {
        let url = URL(string: "https://oppdal-skisenter.herokuapp.com/v1/weather-report")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        DispatchQueue.main.async {
            self.weatherStations = try! decoder.decode([WeatherStation].self, from: data)
        }
    }
}

struct Camera: Codable, Identifiable {
    let id: Int
    let name, url: String
    let zone: Int
}

// MARK: - WeatherStation
struct WeatherStation: Codable, Identifiable {
    let id = UUID()
    let stationID: Int
    let stationName, dateTime: String
    let wind: Wind
    let light: Int?
    let daily: Daily
    let temperature: Double
    let zone: Int
    let humidity, pressure: Double?

    enum CodingKeys: String, CodingKey {
        case stationID = "stationId"
        case stationName, dateTime, wind, light, daily, temperature, zone, humidity, pressure
    }
}

// MARK: - Daily
struct Daily: Codable {
    let maxTemp, minTemp: Double

    enum CodingKeys: String, CodingKey {
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed, gust, min: Double
    let unit: String
    let direction: Int
}

typealias WeatherStations = [WeatherStation]



