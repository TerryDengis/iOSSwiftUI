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
                GridView(gameVM.cardsDealt) { card in
                    CardView (card: card)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.55, dampingFraction: 0.15, blendDuration: 0.0)) {
                                self.gameVM.choose(card: card)
                            }
                        }
                    .transition(.offset(randomOffscreenPosition()))
                }
                
                HStack {
                    Text("Matched Sets: ")
                    Spacer()
                    Button ("Hint") {
                        
                    }
                    Spacer()
                    Button ("Deal") {
                        withAnimation (.easeInOut(duration: 1.0)) {
                            self.gameVM.dealThree()
                        }
                    }
                    .disabled(gameVM.isEmpty())
                }
                .padding()
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2.0)){
                    self.gameVM.newGame()
                }
            }
            .navigationBarTitle("Set Solitare")
            .navigationBarItems(leading: Text("Score : "), trailing: Button("New Game"){
                withAnimation(.easeInOut(duration: 2.0)){
                    self.gameVM.newGame()
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private func randomOffscreenPosition() -> CGSize {
    let angle = Double.random(in: 0..<(2 * Double.pi))
    let distance = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) * CGFloat(2.0.squareRoot())
    print (CGSize(width: distance * CGFloat(cos(angle)), height: distance * CGFloat(sin(angle))))
    return CGSize(width: distance * CGFloat(cos(angle)), height: distance * CGFloat(sin(angle)))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetSolitareVM()
        //game.newGame()
        return SetSolitareGameView(gameVM: game)
    }
}
