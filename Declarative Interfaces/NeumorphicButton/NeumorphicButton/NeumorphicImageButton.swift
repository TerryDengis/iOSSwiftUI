//
//  NeumorphicButton.swift
//  NeumorphicButton
//
//  Created by Terry Dengis on 9/30/20.
//

import SwiftUI

struct NeumorphicImageButton: View {
    private var imageName: String
    private var size: CGSize
    private var onTap: () -> Void

    
    @State private var isPressed = false
    
    init(imageName: String, size: CGSize = CGSize(width: 60, height: 60), onTap: @escaping () -> Void) {
        self.imageName = imageName
        self.size = size
        self.onTap = onTap
    }
    
    var gray: Color {
        Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    }
    
    var white: Color {
        Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    var body: some View {
        Button(action: {
            
            self.isPressed = true
            DispatchQueue.main.asyncAfter (deadline: .now() + 0.2) {
                self.isPressed = false
                self.onTap()
            }
            
        }) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .padding()
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        }
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .shadow(color: isPressed ? white : gray, radius: isPressed ? 4 : 8, x: 8, y: 8)
        .shadow(color: isPressed ? gray : white, radius: isPressed ? 4 : 8, x: -8, y: -8)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring())
    }
}

struct NeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageButton(imageName: "heart.fill"){}
            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)))
    }
}
