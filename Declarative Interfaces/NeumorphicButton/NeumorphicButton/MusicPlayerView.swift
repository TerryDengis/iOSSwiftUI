//
//  MusicPlayerView.swift
//  NeumorphicButton
//
//  Created by Terry Dengis on 9/30/20.
//

import SwiftUI

struct MusicPlayerView: View {
    @State private var sliderValue: Double = 0.5
    
    var gray: Color {
        Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    }
    
    var white: Color {
        Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    var body: some View {

        VStack {
            HStack {
                NeumorphicImageButton(imageName: "arrow.left", size: CGSize(width: 20, height: 20)) {
                        // do your thing
                }
                Spacer ()
                Text("Playing now")
                Spacer()
                NeumorphicImageButton(imageName: "line.horizontal.3", size: CGSize(width: 20, height: 20)) {
                    // do your thing
                }
            }
            .padding()
            .foregroundColor(.black)
            
            ZStack {
                Image("art")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding()
                    .shadow(color: gray, radius: 8, x: 9, y: 9)
                    .shadow(color: white, radius: 8, x: -9, y: -9)
                    .background(white)
            }
            .clipShape(Circle().inset(by:8))
            .shadow(color: gray, radius: 10, x: 9, y: 9)
            .shadow(color: white, radius: 10, x: -9, y: -9)
            Spacer()
            VStack {
                Text ("Lose it")
                    .font(.headline)
                Text ("Flume ft, Vic Mensa")
                    .font(.subheadline)
            }
            Spacer ()
            Slider(value: $sliderValue, in: 0...1, step: 0.1)
                .shadow(color: gray, radius: 8, x: 9, y: 9)
                .shadow(color: white, radius: 8, x: -9, y: -9)
                .padding()
            Spacer ()
            HStack {
                NeumorphicImageButton(imageName: "backward.fill", size: CGSize(width: 30, height: 30)) {
                    // do your thing
                }

                Spacer()
                NeumorphicImageButton(imageName: "stop.fill", size: CGSize(width: 30, height: 30)) {
                    // do your thing
                }

                Spacer()
                NeumorphicImageButton(imageName: "forward.fill", size: CGSize(width: 30, height: 30)) {
                    // do your thing
                }
 
            }
            .foregroundColor(.black)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
