//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Weerachai Anotaipaiboon on 1/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess = RGB()
    @State var showScore = false
    var body: some View {
        VStack {
            Color(red: game.target.red, green: game.target.green, blue: game.target.blue)
            Text("R: ??? G: ??? B: ???")
            Color(red: guess.red, green: guess.green, blue: guess.blue)
            Text(guess.intString())
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)
            Button("Hit Me!!!") {
                showScore = true
                game.check(guess: guess)
            }
            .alert(isPresented: $showScore) {
                Alert(
                    title: Text("Your Score"),
                    message: Text(String(game.score)),
                    dismissButton: .default(Text("OK")) {
                        guess = RGB()
                        game.startNewGame()
                    }
                )
            }
        }
        .padding()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
