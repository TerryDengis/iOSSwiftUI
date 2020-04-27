//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Terry Dengis on 4/25/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK - PROPRETIES
    var cards: [Card] = cardData
    
    // MARK: - CONTENT
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack (alignment: .center, spacing: 20){
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
        .padding(20)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
        .previewDevice("iPhone 11")
    }
}
