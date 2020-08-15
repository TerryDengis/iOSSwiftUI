//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Terry Dengis on 8/5/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameVM
    
    var body: some View {
        NavigationView {
            VStack {
                Grid(viewModel.cards) { card in
                    CardView(card:card)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.75)) {
                                self.viewModel.choose(card: card)
                            }
                    }
                    .padding(5)
                    .aspectRatio(2/3, contentMode: .fit)
                }
                .padding()
                .foregroundColor(self.viewModel.theme.color)
            }
            .navigationBarTitle(viewModel.theme.name)
            .navigationBarItems(leading: Text("Score : \(viewModel.score)"), trailing: Button("New Game"){
                withAnimation(.easeInOut){
                    self.viewModel.newGame()
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder // list of views
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            .onAppear {
                                self.startBonusAnimation()
                        }
                    }
                    else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusTimeRemaining*360-90), clockwise: true)
                    }
                }
                .padding(5)
                .opacity(0.4)
                .transition(.scale)

                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameVM()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

// MARK: - Drawing Constants
private let fontScaleFactor: CGFloat = 0.7
