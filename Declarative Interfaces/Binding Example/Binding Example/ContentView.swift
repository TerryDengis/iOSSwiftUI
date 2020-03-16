//
//  ContentView.swift
//  Binding Example
//
//  Created by Terry Dengis on 10/30/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var name = ""
    
    private func printName () {
        print (self.name)
    }
    
    var body: some View {
         VStack {
            Text(name)
            TextField ("Enter name", text: $name)
            .padding(10)
            Button (action: printName) {
                Text ("Show Name Value")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
