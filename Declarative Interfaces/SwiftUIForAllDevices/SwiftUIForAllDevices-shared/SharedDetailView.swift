//
//  SharedDetailView.swift
//  SwiftUIForAllDevices
//
//  Created by Terry Dengis on 11/11/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct SharedDetailView: View {
    let animal: Animal
    var body: some View {
        VStack {
            Text(animal.image)
                .font (.custom("SF Pro Text", size: 100))
                .padding()
            Text(animal.name)
                .font (.largeTitle)
                .padding()
            Text (animal.description)
                .font (.headline)
            .padding()
        }
    }
}

struct SharedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SharedDetailView(animal: Animal(name: "Turtle", description: "This is a turtle", image: "🐢"))
    }
}
