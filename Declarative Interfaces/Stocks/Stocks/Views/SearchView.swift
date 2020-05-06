//
//  SearchView.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI



struct SearchView: View {
  // MARK: - PROPERTIES
  @Binding var searchTerm: String
  
    var body: some View {
      HStack {
        Spacer ()
        Image(systemName: "magnifyingglass")
        TextField("Search", text: self.$searchTerm)
          .foregroundColor (.primary)
        .padding(10)
        Spacer()
      }.foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
      .cornerRadius(10)
      .padding (10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
      SearchView(searchTerm: .constant(""))
    }
}
