//
//  ContentView.swift
//  Grid-Demo
//
//  Created by Terry Dengis on 10/29/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let dishes = Dish.all()
    
    var body: some View {
        let chunkedDishes = dishes.chunked(into: 2)
        
        return List {
            ForEach (0..<chunkedDishes.count) {index in
                HStack {
                    ForEach (chunkedDishes[index]) {dish in
                        Image (dish.imageURL)
                        .resizable()
                        .frame (width:200, height:200)
                        .scaledToFit()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
