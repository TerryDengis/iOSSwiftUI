//
//  ContentView.swift
//  UserDefaults+SwiftUI
//
//  Created by Mohammad Azam on 9/3/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var settingsVM = SettingsViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            
            Toggle(isOn: self.$settingsVM.isOn) {
                Text("")
            }.fixedSize()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.$settingsVM.isOn.wrappedValue ? Color.green : Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
