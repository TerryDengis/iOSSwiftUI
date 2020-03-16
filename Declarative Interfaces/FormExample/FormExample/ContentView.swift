//
//  ContentView.swift
//  FormExample
//
//  Created by Terry Dengis on 11/6/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scheduled: Bool = false
    @State private var manuallyEnable = false
    @State private var colorTemperature: CGFloat = 0.1
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section (header: Text ("Night shift automatically shifts colors of your display to the warmer end of the color spectrum after dark.  This may help you get a better night's sleep.").padding ()) {
                    Toggle(isOn: $scheduled) {
                        Text("Scheduled")
                    }
                    
                    HStack {
                        VStack {
                            Text ("From")
                            Text ("To")
                        }
                            Spacer ()
                        NavigationLink (destination: Text ("Schedule Settings")) {
                            VStack {
                                Text ("Sunse")
                                    .foregroundColor (Color.blue)
                                Text ("Sunrise")
                                    .foregroundColor (Color.blue)
                            }
                        }.fixedSize()
                    }
                }
                Section (header: Text("")) {
                    Toggle(isOn: $manuallyEnable) {
                        Text("Manually Enable Until Tomorrow")
                    }
                }
                Section (header: Text("COLOR TEMPERATURE")) {
                    VStack {
                        HStack {
                            Text("Less Warm")
                            Spacer ()
                            Text("More Warm")
                        }
                        Slider (value: $colorTemperature)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
