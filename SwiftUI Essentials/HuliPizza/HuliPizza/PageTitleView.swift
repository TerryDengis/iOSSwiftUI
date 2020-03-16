//
//  PageTitleView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct PageTitleView: View {
    var title: String
    var isDisplayingOrders:Bool! = nil
    
    var body: some View {
        HStack {
            Spacer ()
            Text(self.title)
                .font (.largeTitle)
                .fontWeight(.heavy)
                .padding(.trailing)
        }.overlay (
            Image (systemName: "chevron.up.square")
                .rotationEffect(isDisplayingOrders ?? false ? Angle(degrees: 0) : Angle (degrees: 180))
                .animation(.easeInOut (duration: 0.5))
                .font (.title)
                .foregroundColor(isDisplayingOrders != nil ? Color ("G1") : .clear)
                .padding(),
            alignment: .leading
        )
        .foregroundColor(Color ("G1"))
        .background(Color ("G4"))
    }
}

struct PageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PageTitleView(title: "Title", isDisplayingOrders: true)
    }
}
