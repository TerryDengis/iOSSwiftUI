//
//  MapView.swift
//  NearMe
//
//  Created by Terry Dengis on 5/8/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
  let landmarks: [Landmark]
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let map = MKMapView()
    map.showsUserLocation = true
    map.delegate = context.coordinator
    return map
  }
  
  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    updateAnnotations(from: uiView)
  }
  
  private func updateAnnotations(from mapView: MKMapView) {
    
    mapView.removeAnnotations(mapView.annotations)
    let annotations = self.landmarks.map(LandmarkAnnotation.init)
    mapView.addAnnotations(annotations)
  }
  
}
