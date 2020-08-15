//
//  LogoView.swift
//  SlotMachine
//
//  Created by Terry Dengis on 5/12/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
      Image("gfx-slot-machine")
        .resizable()
        .scaledToFit()
        .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
        .padding(.horizontal)
        .layoutPriority(1)
        .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}