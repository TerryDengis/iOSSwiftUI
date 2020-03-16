//
//  ContentView.swift
//  Podcast-Player
//
//  Created by Terry Dengis on 10/30/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let episode = Episode (name: "Macbreak Weekly", track: "WWDC 2019")
    
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Text  (self.episode.name)
                .font (.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            Text (self.episode.track)
                .foregroundColor(.secondary)
            PlayButton (isPlaying: $isPlaying)
        }
    }
}

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Text("Play")
                .font(.title)
            } .padding()
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
