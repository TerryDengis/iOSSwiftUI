//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/13/20.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content                        .font(.headline)
            .padding()
            .frame(minWidth:0, maxWidth: .infinity)
            .background(Capsule().fill(Color.pink))
            .foregroundColor(.white)
    }
}

extension View {
    func buttonModifier () -> some View {
        self.modifier(ButtonModifier())
    }
}
