//
//  ContentView.swift
//  NeumorphicButton
//
//  Created by Terry Dengis on 9/30/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            NeumorphicImageButton(imageName: "heart.fill") {
                // whatever you want to do
            }
            .padding()
            Text ("Press me")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9005962014, green: 0.8856688142, blue: 0.8988618255, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
