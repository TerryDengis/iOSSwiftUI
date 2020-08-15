//
//  SetSolitareGameView.swift
//  Set Solitare
//
//  Created by Terry Dengis on 8/14/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct SetSolitareGameView: View {
    @ObservedObject var gameVM: SetSolitareVM
    
    var body: some View {
        NavigationView {
            VStack {
                Grid(gameVM.cardsDealt) { card in
                    CardView (card: card)
                        .onTapGesture {
                            self.gameVM.choose(card: card)
                        }
                }
            }
            .navigationBarTitle("Set Solitare")
            .navigationBarItems(leading: Text("Score :"), trailing: Button("New Game"){
                withAnimation(.easeInOut){
                    self.gameVM.newGame()
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetSolitareVM()
        game.newGame()
        return SetSolitareGameView(gameVM: game)
    }
}
