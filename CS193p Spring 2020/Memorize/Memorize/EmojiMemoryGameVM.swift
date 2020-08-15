//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Terry Dengis on 8/5/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

class EmojiMemoryGameVM: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    private(set) var theme = themes.randomElement()!
    
    private static func createMemoryGame (_ theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairs: theme.numberOfPairs ?? Int.random(in: 3...theme.emojis.count)) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    init(){
        theme.emojis.shuffle()
        model =  EmojiMemoryGameVM.createMemoryGame(theme)
    }
    
    func newGame () {
        theme = themes.randomElement()!
        theme.emojis.shuffle()
        model =  EmojiMemoryGameVM.createMemoryGame(theme)
    }
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

