//
//  ContentView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var orderModel: OrderModel
    @State var isMenuDisplayed:Bool = true
    
    var body: some View {
        VStack {
            //ContentHeaderView ()
            //    .layoutPriority(2)
            Button (action: {
                self.isMenuDisplayed.toggle()
            }) {
                PageTitleView (title: "Order Pizza", isDisplayingOrders: isMenuDisplayed)
                    .padding (.bottom, 6)
            }
            MenuListView (orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView (orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
            .animation(.spring())
            Spacer()
        }
        
        .padding()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(orderModel: OrderModel ())
                .environmentObject (UserPreferences())

                //.colorScheme(.dark)
                //.background(Color.black)
//            ContentView(orderModel: OrderModel ())
                //.environmentObject (UserPreferences())


        }
    }
}
