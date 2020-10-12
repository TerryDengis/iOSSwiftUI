//
//  AnimatedButtonView.swift
//  ToDo
//
//  Created by Terry Dengis on 10/11/20.
//

import SwiftUI

struct AnimatedButtonView: View {
    @Binding var showView: Bool
    @State private var animatingButton: Bool = false
    @ObservedObject var theme = ThemeSettings.shared
    let themes: [Theme] = themeData
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .fill(themes[theme.themeSettings].themeColor)
                    .opacity (animatingButton ? 0.5 : 0)
                    .frame(width: 68, height: 68, alignment: .center)
                Circle()
                    .fill(themes[theme.themeSettings].themeColor)
                    .opacity (animatingButton ? 0.3 : 0)
                    .frame(width: 88, height: 88, alignment: .center)
            } // ZStack
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            .scaleEffect(animatingButton ? 1.0 : 0.1)
            .onAppear {
                animatingButton.toggle()
            }
            Button(action: {
                showView.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .background(Circle().fill(Color("ColorBase")))
                    .frame(width: 48, height: 48, alignment: .center)
            }
            .accentColor (themes[theme.themeSettings].themeColor)
        } // ZStack
    }
}

struct AnimatedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButtonView(showView: .constant(true))
    }
}
