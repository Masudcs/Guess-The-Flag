//
//  testButton.swift
//  GuessTheFlag
//
//  Created by Md. Masud Rana on 1/23/23.
//

import SwiftUI

struct testButton: View {
    var body: some View {
        VStack {
            Button("Hello") {
                
            }
            .controlSize(.large)
            
            Button("Hello") {
                
            }
            .controlSize(.small)
        }
    }
}

struct testButton_Previews: PreviewProvider {
    static var previews: some View {
        testButton()
    }
}
