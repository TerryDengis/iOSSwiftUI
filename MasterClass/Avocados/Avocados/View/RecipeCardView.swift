//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Terry Dengis on 5/1/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct RecipeCardView: View {
    // MARK: - PROPRETIES
    
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator (style: .heavy)
    
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            // CARD IMAGE
            Image(recipe.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "bookmark")
                            .font(Font.title.weight(.light))
                            .foregroundColor(.white)
                            .imageScale(.small)
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                            .padding(.trailing, 20)
                            .padding(.top, 22)
                        Spacer()
                    }
                }
            )
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                // HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                // RATING
                RecipeRatingView (recipe: recipe)
                
                // COOKING
                RecipeCookingView(recipe: recipe)
            }
        .padding()
            .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            RecipeDetailView(recipe: self.recipe)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipeData[0])
            .previewLayout(.sizeThatFits)
    }
}