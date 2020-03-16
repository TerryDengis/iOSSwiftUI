//
//  ContentView.swift
//  MyCard
//
//  Created by Terry Dengis on 10/10/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color (red: 0.72, green: 0.08, blue: 0.25)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image ("Terry")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150 , height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Terry Dengis")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "(403) 465-2031", imageName: "phone.fill")
                InfoView (text: "Terry.Dengis@icloud.com", imageName: "envelope.fill")
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
