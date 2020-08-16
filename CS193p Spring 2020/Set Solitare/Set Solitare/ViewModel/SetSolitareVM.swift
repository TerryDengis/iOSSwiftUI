//
//  SetSolitareVM.swift
//  Set Solitare
//
//  Created by Terry Dengis on 8/14/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

class SetSolitareVM: ObservableObject {
    @Published private var setModel : SetGame
    
    init () {
        setModel = SetGame()

    }
    
    // MARK: - Access to the model
    var cardsDealt: [SetGame.Card] {
        setModel.cards
    }
    
    // not sure I need this
    var deck: [SetGame.Card] {
        setModel.deck
    }
    
    // MARK: - Intent(s)
    func choose(card: SetGame.Card) {
        setModel.choose(card)
    }
    
    func newGame() {
        setModel = SetGame()
        deal()
    }
    
    func deal() {
        setModel.deal()
    }
    
    func dealThree() {
        setModel.dealThree()
    }
    
    func isEmpty () -> Bool {
        return setModel.deck.isEmpty
    }
}
