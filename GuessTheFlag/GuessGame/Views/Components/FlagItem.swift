//
//  FlagItem.swift
//  GuessTheFlag
//
//  Created by Md. Masud Rana on 1/14/23.
//

import SwiftUI

struct FlagItem: View {
    var flagName: String

    var body: some View {
        VStack(spacing: 0) {
            Text("The flag of \(flagName)")
                .font(.title.bold())
                .padding(.bottom, 15)
            Button {} label: {
                Image(flagName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        
    }
}

struct FlagItem_Previews: PreviewProvider {
    static var previews: some View {
        FlagItem(flagName: "Russia")
    }
}
