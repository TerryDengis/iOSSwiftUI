//
//  SetGame.swift
//  Set Solitare
//
//  Created by Terry Dengis on 8/14/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation

struct SetGame {
    private (set) var deck: Array<Card>
    private (set) var cards: Array<Card>
    
    struct Card: Identifiable {
        var id: UUID = UUID()
        var shape: Int
        var color: Int
        var shading: Int
        var number: Int
        var isSelected: Bool = false
        var isMatched: Bool = false

    }
    
    init () {
        deck = Array<Card> ()
        cards = Array<Card> ()
        
        for shape in 1...3 {
            for color in 1...3 {
                for shading in 1...3 {
                    for number in 1...3 {
                        deck.append(Card (shape: shape, color: color, shading: shading, number: number))
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card) {
            
            cards[chosenIndex].isSelected = !cards[chosenIndex].isSelected
        }
    }
    
    mutating func deal () {
        for _ in 0...3 {
            dealThree()
        }
    }
    
    mutating func dealThree() {
        for _ in 1...3 {
            cards.append(deck.removeFirst())
        }
    }
}
