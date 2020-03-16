//
//  AnotherForm.swift
//  FormExample
//
//  Created by Terry Dengis on 11/6/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct AnotherForm: View {
    @State private var images = ["🗾","🌅","🌄","🌠","🎇","🌇","🗾","🌅","🌄","🌠","🎇","🌇"]
    
    var body: some View {
        NavigationView {
            Form {
                
                Section (footer: Text ("Notification previews will be shown whether the iPhone is locked or unlocked")) {
                    HStack {
                        Text ("Show Previews")
                        Spacer ()
                        NavigationLink (destination: Text ("")) {
                            Text("Always")
                                .foregroundColor(Color.gray)
                        }.fixedSize()
                    }
                }
                Section (footer: Text("Choose while apps can suggest shortcuts on the lock screen")) {
                    NavigationLink (destination: Text("")) {
                        Text("Siri Suggestions")
                    }
                }
                Section (header: Text("NOTICICATION STYLE")) {
                    ForEach (self.images, id: \.self) { img in
                        HStack {
                            Text (img)
                                .font(.largeTitle)
                            Text ("Notification")
                        }
                    }
                }
                .navigationBarTitle("Notifications", displayMode: .inline)
            }
        }
    }
}

struct AnotherForm_Previews: PreviewProvider {
    static var previews: some View {
        AnotherForm()
    }
}
