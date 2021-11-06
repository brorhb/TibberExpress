//
//  WeatherStation.swift
//  TibberExpress (iOS)
//
//  Created by Bror Brurberg on 06/11/2021.
//

import SwiftUI

struct WeatherStationView: View {
    func getWindDirection(val: Int) -> String {
      if (val >= 0 && val < 22) {
        return "Nord";
      } else if (val >= 22 && val < 67) {
        return "Nord-øst";
      } else if (val >= 67 && val < 112) {
        return "Øst";
      } else if (val >= 112 && val < 157) {
        return "Sør-øst";
      } else if (val >= 157 && val < 202) {
        return "Sør";
      } else if (val >= 202 && val < 247) {
        return "Sør-vest";
      } else if (val >= 247 && val < 292) {
        return "Vest";
      } else if (val >= 292 && val < 337) {
        return "Nord-vest";
      } else {
        return "Nord";
      }
    }
    
    func extractTime(datetimeString: String) -> String {
        return String(datetimeString.split(separator: " ")[1])
    }
    
    var station: WeatherStation
    var body: some View {
        VStack(alignment: .leading) {
            Text(station.stationName)
                .font(.headline)
            Text(extractTime(datetimeString: station.dateTime))
                .font(.footnote)
            VStack(alignment: .leading) {
                Text("🌡 \(String(format: "%.1f", station.temperature))")
                    .foregroundColor(station.temperature <= 0 ? Color.blue : Color.red)
                HStack {
                    Text("⬇️ \(String(format: "%.1f", station.daily.minTemp))")
                        .foregroundColor(station.daily.minTemp <= 0 ? Color.blue : Color.red)
                    Spacer()
                    Text("⬆️ \(String(format: "%.1f", station.daily.maxTemp))")
                        .foregroundColor(station.daily.maxTemp <= 0 ? Color.blue : Color.red)
                }
            }
            .padding(.top)
            VStack(alignment: .leading) {
                Text("💨 \(String(format: "%.1f", station.wind.speed))m/s")
                Text("🧭 \(getWindDirection(val: station.wind.direction))")
                Text("Kast opp til \(String(format: "%.1f", station.wind.gust))m/s")
                    .font(.footnote)
            }.padding(.top)
        }
    }
}

struct WeatherStation_Previews: PreviewProvider {
    static var previews: some View {
        WeatherStationView(station: WeatherStation(stationID: 1, stationName: "Test", dateTime: "2021-11-06 09:25:43", wind: Wind(speed: 5.3, gust: 6.4, min: 4.4, unit: "m/s", direction: 348), light: 542, daily: Daily(maxTemp: 0, minTemp: -5.7), temperature: -4.7, zone: 1, humidity: 95.5, pressure: 959))
    }
}
