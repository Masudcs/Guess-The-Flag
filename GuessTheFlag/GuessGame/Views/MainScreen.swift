//
//  SwiftUIView.swift
//  GuessTheFlag
//
//  Created by Md. Masud Rana on 1/14/23.
//

import SwiftUI

struct MainScreen: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]

    var body: some View {
        TabView {
            FlagScreen(countries: $countries)
                .tabItem {
                    Label("Flag", systemImage: "book.circle.fill")
                }
            GuessScreen(countries: $countries)
                .tabItem {
                    Label("Game", systemImage: "brain.head.profile")
                }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
