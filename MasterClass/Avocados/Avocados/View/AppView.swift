//
//  AppView.swift
//  Avocados
//
//  Created by Terry Dengis on 4/28/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView () {
            AvocadosView()
            .tabItem({
                Image("tabicon-branch")
                Text ("Avocados")
            })
            ContentView()
            .tabItem({
                Image("tabicon-book")
                Text ("Recipes")
            })
            RipeningStagesView()
            .tabItem({
                Image("tabicon-avocado")
                Text ("Rippening")
            })
            SettingsView()
            .tabItem({
                Image("tabicon-settings")
                Text ("Settings")
            })
        }
        .accentColor(.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environment(\.colorScheme, .dark)
    }
}
