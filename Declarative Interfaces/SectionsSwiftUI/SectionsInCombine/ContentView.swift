//
//  ContentView.swift
//  SectionsInCombine
//
//  Created by Mohammad Azam on 8/12/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var groceryCategories = GroceryCategory.all()
    
    var body: some View {
        List {
            
            ForEach(self.groceryCategories, id: \.title) { gc in
                
                Section(header: Text(gc.title).font(.title)) {
                    ForEach(gc.groceryItems, id: \.title) { gi in
                        Text(gi.title)
                    }
                }
                
            }
            
        }.listStyle(GroupedListStyle())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
