//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Terry Dengis on 10/25/20.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDesintaion: String? = nil
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDesintaion != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDesintaion!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "TerryDengis").previewLayout(.fixed(width:375, height:60))
                .padding()
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDesintaion: "swiftUImasterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width:375, height:60))
                .padding()
        }
    }
}
