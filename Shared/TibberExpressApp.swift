//
//  TibberExpressApp.swift
//  Shared
//
//  Created by Bror Brurberg on 05/11/2021.
//

import SwiftUI

@main
struct TibberExpressApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TibberProvider())
        }
    }
}
