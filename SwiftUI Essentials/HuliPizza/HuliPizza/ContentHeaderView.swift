//
//  ContentHeaderView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        ZStack {
            Image ("Surf Board")
                .resizable()
                .scaledToFit()
            Text("Huli Pizza Company")
                .offset (x: -20)
                .font(Font.custom("Avinir-Black", size: 20))
                .foregroundColor(.white)
        }
    }
}
struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
    }
}
