//
//  Home.swift
//  TibberExpress (iOS)
//
//  Created by Bror Brurberg on 05/11/2021.
//

import SwiftUI

struct HomeView: View {
    func highestPrice() -> String {
        guard let today = home.currentSubscription?.priceInfo?.today else {return "Ukjent"}
        let unwrappedPrices = today.compactMap { $0 }
        let sorted = unwrappedPrices.sorted { $0.total! > $1.total! }
        return "\(Int(sorted.first!.total! * 100))"
    }
    
    var home: OverviewQuery.Data.Viewer.Home
    
    func getLowestPrice() -> String {
        guard let today = home.currentSubscription?.priceInfo?.today else {return "Ukjent"}
        let unwrappedPrices = today.compactMap { $0 }
        let sorted = unwrappedPrices.sorted { $0.total! < $1.total! }
        return "\(Int(sorted.first!.total! * 100))"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(home.address!.address1!)
                .font(.headline)
            Text(home.address!.postalCode! + " " + (home.address?.city!)!)
                .font(.footnote)
            Text("Pris nå: \(Int(round(home.currentSubscription!.priceInfo!.current!.total! * 100))) øre")
                .padding(.top)
            Text("Beste pris i dag 🤑 \(getLowestPrice()) øre")
                .padding(.top)
            Text("Dårligste pris i dag 💸 \(highestPrice()) øre")
        }
    }
}
