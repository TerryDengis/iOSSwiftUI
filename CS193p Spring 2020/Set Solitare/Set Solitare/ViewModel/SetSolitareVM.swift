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
    
    var gameScore: Int
    
    enum shapeFeature : Int {
        case rectangle = 1
        case circle = 2
        case capsule = 3
    }
    
    enum shadingFeature : Int {
        case solid = 1
        case Opaque = 2
        case empty = 3
    }
    
    enum colorFeature : Int {
        case  red = 1
        case  green = 2
        case  blue = 3
    }
    
    struct viewableCard: Identifiable {
        var id: UUID
        var numberOfShapes: Int
        var shape: shapeFeature
        var color: colorFeature
        var shading: shadingFeature
    }
    
//    private func makeViewableCards () -> Array<viewableCard> {
//        var viewableCards = Array<viewableCard> ()
//
//        setModel.cardsDealt.forEach { card in
//
//        }
//
//        return viewableCards
//    }
    
    init () {
        setModel = SetGame()
        gameScore = 0
    }
    
    // MARK: - Access to the model
    var cardsDealt: [SetGame.Card] {
        
        //Should I makeViewableCards from the model that better suits the view????
        
        setModel.cardsDealt
    }
    
    // not sure I need this
    var deck: [SetGame.Card] {
        setModel.deck
    }
    
    // not sure I need this
    var matchedCards: [SetGame.Card] {
        setModel.matchedCards
    }
    
    // MARK: - Intent(s)
    func choose(card: SetGame.Card) {
        setModel.choose(card)
    }
    
    func newGame() {
        setModel = SetGame()
        gameScore = 0
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
    
    func matchedSets () -> Int {
        setModel.matchedCards.count / 3
    }
    
    func resetMismatch () {
        setModel.resetMismatch()
    }
    
    func hint () {
        if let hintIndices = setModel.isThereAValidSet() {
            print ("Hint: \(hintIndices)")
        } else {
            print ("No matches")
        }
    }
}
