//
//  ContentView.swift
//  SwiftUIForAllDevices-watchOS Extension
//
//  Created by Terry Dengis on 11/11/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let animals = AnimalService.getAll()
    
    var body: some View {
        List {
            ForEach(self.animals, id:\.name) { animal in
                NavigationLink (destination: SharedDetailView(animal: animal)) {
                    AnimalCell(animal: animal)
                }
                
            }
        }.listStyle(CarouselListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalCell: View {
    let animal : Animal
    
    var body: some View {
        VStack(alignment: .center) {
            Text (animal.image)
                .font (.largeTitle)
            Text (animal.name)
                .font(.headline)
        }.frame (minWidth: 0, maxWidth: .infinity)
    }
}
