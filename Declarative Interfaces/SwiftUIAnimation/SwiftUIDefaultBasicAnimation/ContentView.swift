//
//  ContentView.swift
//  SwiftUIDefaultBasicAnimation
//
//  Created by Mohammad Azam on 9/20/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("🐦")
                .font(.custom("Arial", size: 100))
                .scaleEffect(self.showDetails ? 2 : 1)
                //.animation(.default)
                .rotationEffect(.degrees(self.showDetails ? 360.0 : 0.0))
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
            Spacer()
            Button("Press me") {
                self.showDetails.toggle()
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
