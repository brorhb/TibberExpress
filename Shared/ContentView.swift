//
//  ContentView.swift
//  Shared
//
//  Created by Bror Brurberg on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tibberProvider: TibberProvider
    @EnvironmentObject var skiliftProvider: SkiliftProvider
    @State private var initLoad = true
    var body: some View {
        NavigationView {
            VStack {
                if initLoad {
                    ProgressView()
                } else {
                    List {
                        Section(header: Text("⚡️")) {
                            ForEach(tibberProvider.overview!.homes, id: \.!.id) {home in
                                HomeView(home: home!)
                            }
                        }
                        Section(header: Text("🎥")) {
                            ForEach(skiliftProvider.cameras) { camera in
                                CameraView(camera: camera)
                            }
                        }
                        Section(header: Text("🚡")) {
                            ForEach(skiliftProvider.weatherStations) {weatherStation in
                                WeatherStationView(station: weatherStation)
                            }
                        }
                    }.refreshable {
                        await tibberProvider.fetch()
                        do {
                            try await skiliftProvider.fetchWeatherData()
                            try await skiliftProvider.fetchCameras()
                        } catch (let error) {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle("Oversikt 🏡")
        }
        .onAppear {
            Task {
                await tibberProvider.fetch()
                do {
                    try await skiliftProvider.fetchWeatherData()
                    try await skiliftProvider.fetchCameras()
                } catch (let error) {
                    print(error)
                }
                initLoad = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
