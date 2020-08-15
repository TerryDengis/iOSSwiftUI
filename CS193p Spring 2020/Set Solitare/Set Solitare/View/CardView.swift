//
//  CardView.swift
//  Set Solitare
//
//  Created by Terry Dengis on 8/14/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

// MARK: - Drawing Constants
private let cardCornerRadius: CGFloat = 10.0
private let cardLineWidth: CGFloat = 3.0
private let cardSelectedLineWidth: CGFloat = 9.0
private let shapeLineWidth: CGFloat = 2.0
private let shadeOpaque: Double = 0.25
private let shadeSolid: Double = 1.0
private let shadeEmpty: Double = 0.0
private let cardOpacity: Double = 0.2

struct CardView: View {
    var card: SetGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private var shapeColor: Color {
        get {
            if card.color == colorFeature.blue.rawValue {
                return Color.blue
            } else if card.color == colorFeature.red.rawValue {
                return Color.red
            } else { //colorFeature.green
                return Color.green
            }
        }
    }
    private var cardBoderWidth: CGFloat {
        get {
            if card.isSelected {
                return cardSelectedLineWidth
            } else {
                return cardLineWidth
            }
        }
    }
    
    private var cardBorderColor: Color {
        get {
            if card.isSelected {
                return Color.black
            } else {
                return Color.gray
            }
        }
    }
    
    private var shapeOpacity: Double {
        get {
            if card.shading == shadingFeature.solid.rawValue {
                return shadeSolid
            } else if card.shading == shadingFeature.Opaque.rawValue {
                return shadeOpaque
            } else { //shadingFeature.empty
                return shadeEmpty
            }
        }
    }
    
    @ViewBuilder
    private func draw () -> some View {
        
        if card.shape == shapeFeature.rectangle.rawValue {
            ZStack {
                Rectangle ()
                    .fill(shapeColor)
                    .opacity(shapeOpacity)
                Rectangle ()
                    .stroke(lineWidth: shapeLineWidth)
            }
            .aspectRatio(1.0, contentMode: .fit)
            .foregroundColor(shapeColor)
            
        } else if card.shape == shapeFeature.capsule.rawValue {
            ZStack {
                Capsule ()
                    .fill(shapeColor)
                    .opacity(shapeOpacity)
                Capsule ()
                    .stroke(lineWidth: shapeLineWidth)
            }
            .aspectRatio(7/3, contentMode: .fit)
            .foregroundColor(shapeColor)

        } else if card.shape == shapeFeature.circle.rawValue {
            ZStack {
                Circle ()
                    .fill(shapeColor)
                    .opacity(shapeOpacity)
                Circle ()
                    .stroke(lineWidth: shapeLineWidth)
            }
            .foregroundColor(shapeColor)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardCornerRadius)
                .fill(Color.gray)
                .opacity(cardOpacity)
            RoundedRectangle(cornerRadius: cardCornerRadius)
                .stroke(lineWidth: cardBoderWidth)
            VStack {
                ForEach (0..<card.number) { _ in
                    self.draw()
                }
            }
            .padding()
        }
        .foregroundColor(cardBorderColor)
        .padding(5)
        .aspectRatio(2/3, contentMode: .fit)
    }
}

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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGame.Card(id: UUID(), shape: 3, color: 3, shading: 2, number: 3, isSelected: true)
        return CardView(card: card)
    }
}
