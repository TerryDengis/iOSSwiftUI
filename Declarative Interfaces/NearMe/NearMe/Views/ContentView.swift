//
//  ContentView.swift
//  NearMe
//
//  Created by Terry Dengis on 5/8/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
  
  private var locationManger = LocationManager()
  
  @State private var search: String = ""
  @State private var landmarks = [Landmark]()
  @State private var tapped: Bool = false
  
  private func getNearByLandmarks() {
    guard let location = locationManger.location else {
      return
    }
    
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = search
    request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    let search = MKLocalSearch(request: request)
    search.start { (resp, err) in
      guard let response = resp, err == nil else {
        return
      }
      
      let mapItems = response.mapItems
      self.landmarks = mapItems.map {
        Landmark(placemark: $0.placemark)
      }
    }
    
  }
  
  func calculateOffest() -> CGFloat {
    if landmarks.count > 0 && !tapped {
      return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
    } else if tapped{
      return 100
    } else {
      return UIScreen.main.bounds.size.height
    }
    
  }
  
  var body: some View {
    ZStack (alignment: .top) {
      MapView(landmarks: landmarks)
      
      TextField("Search", text: $search, onEditingChanged: { _ in }) {
        self.getNearByLandmarks()
      }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding ()
        .offset(y: 45)
      PlaceListView (landMarks: self.landmarks) {
        self.tapped.toggle()
      }
        .offset(y: calculateOffest())
      .animation(.spring())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
