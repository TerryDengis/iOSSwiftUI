//
//  Landmark.swift
//  NearMe
//
//  Created by Terry Dengis on 5/8/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
  
  let placemark: MKPlacemark
  
  var id: UUID {
    UUID()
  }
  var name: String {
    placemark.name ?? ""
  }
  var title: String {
    placemark.title ?? ""
  }
  var coordinate: CLLocationCoordinate2D {
    placemark.coordinate
  }
}
