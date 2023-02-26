//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Md. Masud Rana on 1/10/23.
//

import SwiftUI

struct GuessScreen: View {
    @Binding var countries: [String]
     var labels: [String: String]

    @State private var scoreValue = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var countFlag = 0
    @State private var rotationAmount = [0.0, 0.0, 0.0]
    @State private var trackTappedNumber = 0

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                Gradient.Stop(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                Gradient.Stop(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ],
            center: .top,
            startRadius: 200,
            endRadius: 700)

            VStack(spacing: 0) {
                Spacer()

                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                VStack(spacing: 20) {
                    VStack(spacing: 0) {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .accessibilityElement(children: .combine)

                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTapped(number)
                            countFlag += 1

                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(color: .gray, radius: 5)
                                .accessibilityLabel(labels[countries[number]] ?? "Unknown flag")
                        }
                        //.controlSize(number != trackTappedNumber ? .small : .large)
                        .rotation3DEffect(
                            .degrees(self.rotationAmount[number]),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .opacity(showingScore && number != trackTappedNumber ? 0.25 : 1)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()

                Text(countFlag == 8 ? "0" : "Score: \(scoreValue)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(countFlag == 8 ? "Game Over" : "Continue", action: askQuestion)
        } message: {
            if countFlag == 8 {
                Text("Your Total score: \(scoreValue)")
            } else if scoreTitle == "Correct" {
                Text("Your score increase +10 ")
            } else {
                Text("Your score descrease -10")
            }
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            if countFlag == 8 {
                scoreValue = 0
                countFlag = 0
                rotationAmount = [0.0, 0.0, 0.0]
            }

            scoreTitle = "Correct"
            scoreValue += 10

        } else {
            if countFlag == 8 {
                scoreValue = 0
                countFlag = 0
                rotationAmount = [0.0, 0.0, 0.0]
            }

            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            scoreValue -= 10
        }
        showingScore = true
        withAnimation(.spring()) {
            rotationAmount[number] += 360
            trackTappedNumber = number
        }
    }

    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 2 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessScreen(countries: .constant([]), labels: [:])
    }
}
