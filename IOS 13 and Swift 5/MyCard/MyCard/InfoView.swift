//
//  InfoView.swift
//  MyCard
//
//  Created by Terry Dengis on 10/17/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill (Color("Info Color"))
            .frame (height: 50)
            .overlay(HStack {
                Image (systemName: imageName)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color (red: 0.72, green: 0.08, blue: 0.25))
                    .frame(width: 30)
                Text (text)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "(403) 555-1234", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
