//
//  HikeDetail.swift
//  Hiking
//
//  Created by Terry Dengis on 10/29/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Image (hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 1)) {
                        self.zoomed.toggle()
                    }
            }
            Text (hike.name)
                .font (.body)
            Text (String (format: "%.2f miles", hike.miles))
                .font (.body)
        }.navigationBarTitle(Text(hike.name), displayMode: .inline)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike.all() [0])
    }
}

