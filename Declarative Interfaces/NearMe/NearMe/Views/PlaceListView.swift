//
//  PlaceListView.swift
//  NearMe
//
//  Created by Terry Dengis on 5/8/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
  
  let landMarks: [Landmark]
  var onTap: () -> ()
  
  var body: some View {
    VStack {
      HStack {
        EmptyView()
      }
      .frame(width: UIScreen.main.bounds.size.width, height: 60)
      .background(Color.blue)
      .gesture(TapGesture()
      .onEnded(self.onTap))
      
      List(self.landMarks, id:\.id) { landmark in
        Text(landmark.name)
      }
    
    }
      .cornerRadius(16)
  }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
      PlaceListView(landMarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
