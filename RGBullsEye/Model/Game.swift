//
//  Game.swift
//  RGBullsEye
//
//  Created by Weerachai Anotaipaiboon on 1/19/24.
//

import Foundation

struct Game {
    var target = RGB.random()
    var score = 0
    
    mutating func check(guess: RGB) {
        let difference = lround(guess.difference(target: target) * 100.0)
        score = 100 - difference
    }
    
    mutating func startNewGame() {
        score = 0
        target = RGB.random()
    }
}
