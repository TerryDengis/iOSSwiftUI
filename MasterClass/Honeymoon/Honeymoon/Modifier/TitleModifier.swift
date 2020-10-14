//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/13/20.
//

import SwiftUI

struct TitleModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}

extension View {
    func titleModifier () -> some View {
        self.modifier(TitleModifier())
    }
}
