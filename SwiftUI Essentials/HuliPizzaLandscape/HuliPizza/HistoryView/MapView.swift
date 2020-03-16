//
//  MapView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/19/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var latitude:Double
    var longitude:Double
    var regionRadius:Double
    
    func makeUIView(context:Context)->MKMapView{
        MKMapView(frame:.zero)
    }
    func updateUIView(_ view:MKMapView, context:Context){
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        view.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
