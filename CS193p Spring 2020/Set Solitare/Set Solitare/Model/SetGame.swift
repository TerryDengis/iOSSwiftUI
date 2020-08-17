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
    private (set) var cardsDealt: Array<Card>
    private (set) var matchedCards: Array<Card>
    
    enum cardStatus : Int {
        case none = 1
        case selected = 2
        case matched = 3
        case mismatched = 4
    }
    
    struct Card: Identifiable {
        var id: UUID = UUID()
        var shape: Int
        var color: Int
        var shading: Int
        var number: Int
        var cardStatus: cardStatus = .none
    }
    
    init () {
        deck = Array<Card> ()
        cardsDealt = Array<Card> ()
        matchedCards = Array<Card> ()
        
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
    
    // Find all cards chosen by the user
    private var selectedIndices: [Int] {
        get {
            //return chosenCardIndices.count > 0 ? chosenCardIndices.map { cardsDealt[$0] } : nil
            return cardsDealt.indices.filter {cardsDealt[$0].cardStatus != cardStatus.none}
        }
    }
    
    private var selectedMismatches: [Int] {
        get {
            return cardsDealt.indices.filter {cardsDealt[$0].cardStatus == cardStatus.mismatched}
        }
    }
    
    private var selectedMatches: [Int] {
        get {
            return cardsDealt.indices.filter {cardsDealt[$0].cardStatus == cardStatus.matched}
        }
    }
    
    mutating func choose(_ card: Card) {
        if selectedIndices.count < 3 {
            if let chosenIndex = cardsDealt.firstIndex(matching: card) {
                if cardsDealt[chosenIndex].cardStatus == .selected{
                    cardsDealt[chosenIndex].cardStatus = .none
                } else if cardsDealt[chosenIndex].cardStatus == .none {
                    cardsDealt[chosenIndex].cardStatus = .selected
                }
                
                let selection = selectedIndices
                if selection.count == 3 {
                    checkForSet(in: selection, forGamePlay: true)
                }
            }
        }
    }
    
    private func compareAttributes (_ a1: Int, _ a2: Int, _ a3: Int) -> Bool {
        return (a1 == a2 && a1==a3 && a2==a3) || (a1 != a2 && a1 != a3 && a2 != a3)
    }
    
    private mutating func checkForSet (in selection: Array<Int>, forGamePlay: Bool) -> Bool {
        let firstCard = cardsDealt[selection[0]]
        let secondCard = cardsDealt[selection[1]]
        let thirdCard = cardsDealt[selection[2]]
        

        let test1 = compareAttributes(firstCard.color, secondCard.color, thirdCard.color)
        let test2 = compareAttributes(firstCard.shading, secondCard.shading, thirdCard.shading)
        let test3 = compareAttributes(firstCard.number, secondCard.number, thirdCard.number)
        let test4 = compareAttributes(firstCard.shape, secondCard.shape, thirdCard.shape)

        var matchStatus: cardStatus = .none
        
        if test1 && test2 && test3 && test4 {
        
            matchStatus = .matched
            // add to score for match
        }
        else {
            matchStatus = .mismatched
            // deduct from score for mismatch
        }
        
        // for testing
        // matchStatus = .matched
        
        // it this call was not for a hint
        if forGamePlay {
            selection.forEach {index in
            cardsDealt[index].cardStatus = matchStatus
            }
        }
        
        return matchStatus == .matched
    }
    
    mutating func deal () {
        for _ in 1...6 {
            cardsDealt.append(deck.removeFirst())
        }
    }
    
    private mutating func appendCards () {
        for _ in 1...3 {
            cardsDealt.append(deck.removeFirst())
        }
    }
    
    private mutating func insertCards () {
        let matchedIndicies = selectedMatches
        
        matchedIndicies.forEach {index in
            if cardsDealt[index].cardStatus == .matched {
                matchedCards.append(cardsDealt[index])
            }
        }
        cardsDealt.removeAll { card in
            card.cardStatus == .matched
        }
        if deck.count >= 3 {
            matchedIndicies.forEach { index in
                cardsDealt.insert(deck.removeFirst(), at: index)
            }
        }
    }
    
    mutating func dealThree() {
        if selectedIndices.count < 3 {
            if (isThereAValidSet() == nil) {
                // if a set exists deduct from score
                print("There not a valid set on deal")
            } else {
                print("There was a valid set on deal")
            }
            appendCards()
            
        } else if selectedMismatches.count == 3 {
            resetMismatch()
            if (isThereAValidSet() == nil) {
                // if a set exists deduct from score
                print ("No valid set on mismatch")
                
            } else {
                print("There was a valid set on mismatch")
            }
            appendCards()
        } else if selectedMatches.count == 3 {
            insertCards()
        }
    }
    
    mutating func resetMismatch () {
        let selection = selectedMismatches
        
        selection.forEach { index in
            cardsDealt[index].cardStatus = .none
        }
    }
    
    mutating func isThereAValidSet () -> Array<Int>? {
        for index1 in 0..<cardsDealt.count-2 {
            for index2 in index1+1..<cardsDealt.count-1 {
                for index3 in index2+1..<cardsDealt.count {
                    let setTest = [index1, index2, index3]
                    if checkForSet(in: setTest, forGamePlay: false) {
                        return setTest
                    }
                }
            }
        }
        return nil
    }
}
