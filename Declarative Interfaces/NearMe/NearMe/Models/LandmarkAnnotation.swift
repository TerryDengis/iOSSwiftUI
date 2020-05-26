//
//  LandmarkAnnotation.swift
//  NearMe
//
//  Created by Terry Dengis on 5/8/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
  
  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(landmark: Landmark) {
    title = landmark.name
    coordinate = landmark.coordinate
  }
  
}
