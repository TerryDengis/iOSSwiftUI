//
//  ReelView.swift
//  SlotMachine
//
//  Created by Terry Dengis on 5/13/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
          .resizable()
      .modifier(ImageModifier())
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
          .previewLayout(.fixed(width: 220, height: 220))}
}
