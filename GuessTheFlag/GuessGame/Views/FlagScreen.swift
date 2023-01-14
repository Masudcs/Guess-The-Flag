//
//  TutorialScreen.swift
//  GuessTheFlag
//
//  Created by Md. Masud Rana on 1/14/23.
//

import SwiftUI

struct FlagScreen: View {
    @Binding var countries: [String]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0 ..< countries.count) { number in
                        FlagItem(flagName: countries[number])
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                        Divider()
                            .overlay {
                                Color.white
                            }
                    }
                }
                .background(.gray.opacity(0.5))
            }
            .navigationTitle("The Flag of Countries")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TutorialScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlagScreen(countries: .constant([]))
    }
}
