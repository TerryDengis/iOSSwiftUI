//
//  EmptyListView.swift
//  ToDo
//
//  Created by Terry Dengis on 10/8/20.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: - Properties
    @State private var isAnimated: Bool = false
    @ObservedObject var theme = ThemeSettings.shared
    let themes: [Theme] = themeData
    
    let images: [String] = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    
    let tips: [String] = [
        "Use your time wisely!",
        "Slow and steady wins the race!",
        "Keep it short and simple!",
        "Do hard tasks first!",
        "Reward yourself after you complete a task!",
        "Schedule tomorrow today!",
        "Organize tasks ahead of time!"
    ]
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 20) {
                Image("\(images.randomElement() ?? images[0])")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                    .foregroundColor(themes[theme.themeSettings].themeColor)
                    
                Text("\(tips.randomElement() ?? tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(themes[theme.themeSettings].themeColor)
            } // VStack
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset (y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1.5))
            .onAppear {
                isAnimated.toggle()
            }
            
        } // ZStack
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .dark)
    }
}
