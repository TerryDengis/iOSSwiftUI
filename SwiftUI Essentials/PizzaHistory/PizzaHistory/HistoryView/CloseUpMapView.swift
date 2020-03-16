//
//  CloseUpMapView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/20/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
import MapKit

/// A view to present a view controller and add a Swift UI title and dismiss button.
struct CloseUpMapView: View {
    @Binding var isMapPresented:Bool
    var historyItem:HistoryItem
    var body: some View {
        VStack{
            PageTitleView(title: historyItem.name)
            MapViewControllerWrapper(latitude: self.historyItem.latitude, longitude: self.historyItem.longitude, regionRadius: 100)
            DismissButton(isPresented: $isMapPresented)
        }
    }
}


/// A generic button to dismiss a view. Changes `$isPresented` to `false` when tapped.
struct DismissButton: View {
    @Binding var isPresented:Bool
    var body: some View {
        Button(action:{self.isPresented = false}){
            Text("Dismiss")
                .padding()
                .background(Color("G2"))
                .foregroundColor(.primary)
                .cornerRadius(5)
        }
    }
}

///Presents the `CloseUpMapView` as a sheet if tapped. Send a `historyItem` in it to get a location.
struct PresentMapButton: View {
    @Binding var isPresented:Bool
    var historyItem:HistoryItem
    var body: some View {
        Button(action:{self.isPresented = true}){
            HStack{
                Image(systemName:"chevron.up.square")
                Text("Detail Map")
                    .fontWeight(.heavy)
                    .padding(10)
            }.padding(.leading)
            .background(Color("G3"))
        }.sheet(isPresented:$isPresented){
            CloseUpMapView(isMapPresented: self.$isPresented,historyItem:self.historyItem)
        }
    }
}

struct MapViewControllerWrapper: UIViewControllerRepresentable {
    var latitude:CLLocationDegrees
    var longitude:CLLocationDegrees
    var regionRadius:CLLocationDistance
    
    typealias UIViewControllerType = MapViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MapViewControllerWrapper>) -> MapViewControllerWrapper.UIViewControllerType {
         return MapViewController()
    }
    
    func updateUIViewController(_ uiViewController: MapViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<MapViewControllerWrapper>) {
        
        uiViewController.latitude = latitude
        uiViewController.longitude = longitude
        uiViewController.regionRadius = regionRadius
        uiViewController.updateMap()
    }
}
