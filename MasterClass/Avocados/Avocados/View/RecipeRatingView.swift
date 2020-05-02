//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Terry Dengis on 5/1/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct RecipeRatingView: View {
    // MARK: - PROPRETIES
    
    var recipe: Recipe
    
    var body: some View {
        HStack (alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id:\.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(recipe: recipeData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
