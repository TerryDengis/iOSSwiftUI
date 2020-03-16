//
//  ContentView.swift
//  HackerNews
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager ()
    
    var body: some View {
        NavigationView {
            
            List (networkManager.posts) { post in
                NavigationLink (destination: DetailView(url: post.url)) {
                    HStack {
                        Text (String (post.points))
                        Text (post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
