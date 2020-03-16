//
//  ContentView.swift
//  SwiftUIForAllDevices
//
//  Created by Terry Dengis on 11/11/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var animals = AnimalService.getAll()
    
    var body: some View {
        
        NavigationView {
            List(self.animals, id:\.name) { animal in
                NavigationLink (destination: SharedDetailView(animal: animal)) {
                    HStack {
                        Text (animal.image)
                            .font(.largeTitle)
                        Text (animal.name)
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("Animals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
