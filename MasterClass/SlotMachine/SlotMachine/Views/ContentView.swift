//
//  ContentView.swift
//  SlotMachine
//
//  Created by Terry Dengis on 5/10/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI



struct ContentView: View {
  // MARK: - PROPERTIES
  let symbols = ["gfx-bell","gfx-cherry","gfx-coin","gfx-grape","gfx-seven","gfx-strawberry"]
  let haptics = UINotificationFeedbackGenerator()
  
  @State private var reels: Array = [0,1,2]
  @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
  @State private var coins: Int = 100
  @State private var betAmount: Int = 10
  @State private var isActiveBet10: Bool = true
  @State private var isActiveBet20: Bool = false
  @State private var showingModal: Bool = false
  @State private var showingInfoView: Bool = false
  @State private var animatingSymbol: Bool = false
  @State private var animatingModal: Bool = false
  
  // MARK: - FUNCTIONS
  
  // spin the reels
  func spinReels() {
    reels = reels.map({_ in Int.random(in: 0...symbols.count - 1)})
    playSound(sound: "spin", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  // check if a winner
  func checkWinningCondition() {
    if reels[0] == reels[1] && reels[1] == reels[2] {
      playerWins ()
      
      if coins > highScore {
        newHighScore()
      } else {
        playSound(sound: "win", type: "mp3")
      }
    } else {
      playerLoses()
    }
  }
  
  func playerWins () {
    coins += betAmount * 10
  }
  
  func newHighScore () {
    highScore = coins
    UserDefaults.standard.set(highScore, forKey: "HighScore")
    playSound(sound: "high-score", type: "mp3")
  }
  
  func playerLoses () {
    coins -= betAmount
  }
  
  func activateBet20 () {
    betAmount = 20
    isActiveBet10 = false
    isActiveBet20 = true
    playSound(sound: "casino-chips", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  func activateBet10 () {
    betAmount = 10
    isActiveBet10 = true
    isActiveBet20 = false
    playSound(sound: "casino-chips", type: "mp3")
    haptics.notificationOccurred(.success)
  } 
  
  func isGameOver () {
    if coins <= 0 {
      showingModal = true
      playSound(sound: "game-over", type: "mp3")
    }
  }
  
  func resetGame() {
    UserDefaults.standard.set(0, forKey: "HighScore")
    highScore = 0
    coins = 100
    activateBet10()
    playSound(sound: "chimeup-", type: "mp3")
  }
  // MARK: - BODY
    var body: some View {
      ZStack {
        
        // MARK: - BACKGROUND
        LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
          .edgesIgnoringSafeArea(.all)
        
        // MARK: - INTERFACE
        VStack(alignment: .center, spacing: 5) {
          
          // MARK: - HEADER
          LogoView()
          Spacer()
          
          // MARK: - SCORE
          HStack {
            HStack {
              Text("Your\nCoins".uppercased())
                .scoreLabelStyle ()
                .multilineTextAlignment(.trailing)
              Text("\(coins)")
                .scoreNumberStyle()
                .modifier(ScoreNumberModifier())
            }
            .modifier(ScoreContainerModifier())
            
            Spacer ()
            
            HStack {
              Text("\(highScore)")
                .scoreNumberStyle()
                .modifier(ScoreNumberModifier())
              Text("High\nScore".uppercased())
                .scoreLabelStyle ()
                .multilineTextAlignment(.leading)

            }
            .modifier(ScoreContainerModifier())
          }
          
          // MARK: - SLOT MACHINE
          VStack(alignment: .center, spacing: 0) {
            ZStack{
              // MARK: - REEL 1
              ReelView()
              Image (symbols[reels[0]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.5...0.7)))
                .onAppear(perform: {
                  self.animatingSymbol.toggle()
                  playSound(sound: "riseup", type: "mp3")
                })
            }
            HStack {
              ZStack{
                // MARK: - REEL 2
                ReelView()
                Image (symbols[reels[1]])
                  .resizable()
                  .modifier(ImageModifier())
                  .opacity(animatingSymbol ? 1 : 0)
                  .offset(y: animatingSymbol ? 0 : -50)
                  .animation(.easeOut(duration: Double.random(in: 0.7...0.9)))
                  .onAppear(perform: {
                    self.animatingSymbol.toggle()
                  })
              }
              
              Spacer()
              
              ZStack{
                // MARK: - REEL 3
                ReelView()
                Image (symbols[reels[2]])
                  .resizable()
                  .modifier(ImageModifier())
                  .opacity(animatingSymbol ? 1 : 0)
                  .offset(y: animatingSymbol ? 0 : -50)
                  .animation(.easeOut(duration: Double.random(in: 0.9...1.1)))
                  .onAppear(perform: {
                    self.animatingSymbol.toggle()
                  })
              }
            }
            .frame(maxWidth: 500)
            // MARK: - SPIN BUTTON
            Button(action: {
              withAnimation {
                self.animatingSymbol = false
              }
              self.spinReels()
              withAnimation {
                self.animatingSymbol = true
              }
              self.checkWinningCondition()
              self.isGameOver()
            }) {
              Image("gfx-spin")
                .renderingMode(.original)
                .resizable()
                .modifier(ImageModifier())
            }
          }
          .layoutPriority(2)
          
          // MARK: - FOOTER
          Spacer()
          
          HStack{
            HStack (alignment: .center, spacing: 10){
              // MARK: - BET 20
              Button(action: {
                self.activateBet20()
              }) {
                Text("20")
                  .fontWeight(.heavy)
                  .foregroundColor(isActiveBet20 ? .yellow : .white)
                  .modifier(BetNumberModifier())
              }
              .modifier(BetCapsuleModifier())
              
              Image("gfx-casino-chips")
                .resizable()
                .offset(x: isActiveBet20 ? 0 : 20)
                .opacity(isActiveBet20 ? 1 : 0)
                .modifier(CasinoChipsModifier())
            }
            Spacer ()
            HStack (alignment: .center, spacing: 10){
              Image("gfx-casino-chips")
                .resizable()
                .offset(x: isActiveBet10 ? 0 : -20)
                .opacity(isActiveBet10 ? 1 : 0)
                .modifier(CasinoChipsModifier())
              
              // MARK: - BET 10
              Button(action: {
                self.activateBet10()
              }) {
                Text("10")
                  .fontWeight(.heavy)
                  .foregroundColor(isActiveBet10 ? .yellow : .white)
                  .modifier(BetNumberModifier())
              }
              .modifier(BetCapsuleModifier())
            }

          }
        }
          // MARK: - BUTTONS
        .overlay(
          Button(action: {
            self.resetGame()
          }) {
            Image (systemName: "arrow.2.circlepath.circle")
          }
          .modifier(ButtonModifier()),
          alignment: .topLeading
        )
          .overlay(
            Button(action: {
              self.showingInfoView = true
            }) {
              Image (systemName: "info.circle")
            }
            .modifier(ButtonModifier()),
            alignment: .topTrailing
        )
        .padding()
        .frame(maxWidth: 720)
        .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
        
        // MARK: - POPUP
        if $showingModal.wrappedValue {
          ZStack {
            Color("ColorTransparentBlack")
              .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
              
              Text("Game Over")
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color("ColorPink"))
                .foregroundColor(.white)
              Spacer()
              VStack(alignment: .center, spacing: 16) {
                Image ("gfx-seven-reel")
                  .resizable()
                  .scaledToFit()
                  .frame(maxHeight:72)
                Text("Bad luck!  You lost all of your coins.  \nLet's play again!")
                  .font(.system(.body, design: .rounded))
                  .lineLimit(2)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.gray)
                  .layoutPriority(1)
                Button(action: {
                  self.showingModal = false
                  self.animatingModal = false
                  self.activateBet10()
                  self.coins = 100
                }) {
                  Text("New Game".uppercased())
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.semibold)
                    .accentColor(Color("ColorPink"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(minWidth:128)
                    .background(
                      Capsule()
                        .stroke(lineWidth: 1.75)
                        .foregroundColor(Color("ColorPink"))
                    )
                }
              }
              Spacer ()
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
            .opacity($animatingModal.wrappedValue ? 1 : 0)
            .offset (y: $animatingModal.wrappedValue ? 0 : -100)
            .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
            .onAppear(perform: {
              self.animatingModal = true
            })
          }
        }
      }
      .sheet(isPresented: $showingInfoView) {
        InfoView()
      }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
