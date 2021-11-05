//
//  ContentView.swift
//  Shared
//
//  Created by Bror Brurberg on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tibberProvider: TibberProvider
    
    var body: some View {
        NavigationView {
            if tibberProvider.loading {
                ProgressView()
            } else {
                List(tibberProvider.overview!.homes, id: \.?.address?.address1) {home in
                    HomeView(home: home!)
                }
                .navigationBarTitle("Adresser 🏡")
            }
        }
        .onAppear {
            Task {
                await tibberProvider.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
