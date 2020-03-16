//
//  ContentView.swift
//  Hiking
//
//  Created by Terry Dengis on 10/29/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let hikes = Hike.all()
    
    var body: some View {
        NavigationView {
            List (hikes) {hike in
                NavigationLink(destination: HikeDetail (hike: hike)) {
                    HikeCell (hike: hike)
                }
            }
            .navigationBarTitle("Hikes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //ContentSizeCategory
            ContentView().colorScheme(.dark)
            //ContentView().previewDevice("iPhone SE")
        }
    }
}

struct HikeCell: View {
    let hike: Hike
    
    var body: some View {
        HStack {
            Image (hike.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            VStack (alignment: .leading){
                Text (hike.name)
                    .font (.title)
                Text (String (format: "%.2f miles", hike.miles))
                    .font (.body)
            }
        }
    }
}
