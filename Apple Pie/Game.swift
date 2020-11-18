//
//  Game.swift
//  Apple Pie
//
//  Created by Andrey Pereslavtsev on 19.11.2020.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    fileprivate var guessedLetters = [Character]()
    
    init(word: String, incorrectMovesRemaining: Int) {
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var guessedWord: String {
        var wordToDisplay = String()
        for letter in word {
            if guessedLetters.contains(Character(letter.lowercased())) {
                wordToDisplay += String(letter)
            } else {
                wordToDisplay += "-"
            }
        }
        return wordToDisplay
    }
    
    mutating func playerGuessed(letter: Character) {
        let lowercasedLetter = Character( letter.lowercased())
        guessedLetters.append(lowercasedLetter)
        if !word.lowercased().contains(lowercasedLetter) {
            incorrectMovesRemaining -= 1
        }
    }
    
}
