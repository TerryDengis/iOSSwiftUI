//
//  CenterModifier.swift
//  Africa
//
//  Created by Terry Dengis on 11/3/20.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {
    func centerModifier () -> some View {
        self.modifier(CenterModifier())
    }
}
