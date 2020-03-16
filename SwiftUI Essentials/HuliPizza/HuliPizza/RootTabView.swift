//
//  RootTabView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            ContentView (orderModel: OrderModel())
                .tabItem {
                    Image (systemName: "cart")
                    Text ("Order")
            }
            HistoryView ()
                .tabItem {
                    Image (systemName: "book")
                    Text ("History")
            }
        }
        .accentColor(Color("B1"))
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
            .environmentObject (UserPreferences())
    }
}
