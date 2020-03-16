//
//  ContentView.swift
//  SwiftUIForAllDevices-macOS
//
//  Created by Terry Dengis on 11/11/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    var body: some View {
        NavigationView {
            GeometryReader { g in
                AnimalList(selectedAnimal: self.$selectedAnimal)
            }
            
            GeometryReader { g -> SharedDetailView in
                if let animal = self.selectedAnimal {
                    return SharedDetailView(animal: animal)
                } else {
                    return SharedDetailView(animal: Animal.placeholder)
                }
            }

            
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalList: View {
    @Binding var selectedAnimal: Animal?
    private let animals = AnimalService.getAll()
    
    var body: some View {
        List (self.animals, id: \.name) { animal in
            VStack {
                Text(animal.image)
                    .font (.largeTitle)
                Text(animal.name)
                    .font(.headline)
            }
            .onTapGesture {
                self.selectedAnimal = animal
            }
        }
    }
}
