//
//  ContentView.swift
//  Avocados
//
//  Created by Terry Dengis on 4/27/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    var headers: [Header] = headerData
    var facts: [Fact] = factData
    var recipes: [Recipe] = recipeData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                
                // MARK: - HEADER
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack  (alignment: .top, spacing: 0) {
                        ForEach (headers) {item in
                            HeaderView(header: item)
                        }
                    }
                }
                
                // MARK: - DISHES
                Text (" Avocado Dishes")
                    .fontWeight(.bold)
                    . modifier(TitleModifier())
                
                DishesView()
                    .frame(maxWidth: 640)
                
                // MARK: - FACTS
                Text ("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        ForEach (facts) {item in
                            FactsView(fact: item)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
                
                // MARK: - RECIPE CARDS
                Text ("Avodado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                VStack(alignment: .center, spacing: 20){
                    ForEach(recipes) { item in
                        RecipeCardView(recipe: item)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                // MARK: - FOOTER
                VStack (alignment: .center, spacing: 20){
                    Text("All about Avocados")
                        .fontWeight(.bold)
                        . modifier(TitleModifier())
                    
                    Text("Everything that you have always wanted to know about avocados but were afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }
        }
        .edgesIgnoringSafeArea(.all)
    .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    func body (content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headerData, facts: factData, recipes: recipeData)
    }
}

