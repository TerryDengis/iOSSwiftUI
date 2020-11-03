//
//  CreditsView.swift
//  Africa
//
//  Created by Terry Dengis on 11/3/20.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {

        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width:128, height:128)
            Text("""
    Copyright © Terry Dengis
    All rights reserved
    Better Apps ♥️ Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } // VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
