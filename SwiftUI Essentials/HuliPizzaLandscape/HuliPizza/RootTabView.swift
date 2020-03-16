//
//  RootTabView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/18/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        TabView{
            if sizeClass == .compact{
                ContentView(orderModel: OrderModel())
                .tabItem{
                    Image(systemName:"cart")
                    Text("Order")
                }
            } else {
                LandscapeContentView(orderModel:OrderModel())
                .tabItem{
                    Image(systemName:"cart")
                    Text("Order")
                }
            }
                
        
            HistoryView()
                .tabItem{
                    Image(systemName:"book")
                    Text("History")
                }
        }
        
            
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView().environmentObject(UserPreferences())
    }
}
