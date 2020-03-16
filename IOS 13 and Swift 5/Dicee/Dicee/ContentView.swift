//
//  DiceeView.swift
//  Dicee
//
//  Created by Terry Dengis on 10/28/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct TableView: View {
    @State var dice1 = 1
    @State var dice2 = 1
    
    var body: some View {
        
        ZStack {
            Image ("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image ("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n:dice1)
                    DiceView(n:dice2)
                }
                .padding(.horizontal)
                Spacer ()
                Button(action: {
                    self.dice1 = Int.random(in: 1...6)
                    self.dice2 = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image ("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding (.all)
    }
}
