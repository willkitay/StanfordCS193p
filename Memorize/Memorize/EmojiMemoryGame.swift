//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Will on 12/27/20.
//
// this is the VIEW-MODEL

import SwiftUI

class emojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    var theme: GameTheme
    
    //task 2
    init() {
        theme = GameTheme.themes.randomElement()!
        model = emojiMemoryGame.createMemoryGame(with: theme)
    }
    
    private static func createMemoryGame(with theme: GameTheme) -> MemoryGame<String> {
        let emojis = theme.emojis
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 6...6)) { pairIndex in
            return emojis.shuffled()[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        theme = GameTheme.themes.randomElement()!
        model = emojiMemoryGame.createMemoryGame(with: theme)
    }
}
