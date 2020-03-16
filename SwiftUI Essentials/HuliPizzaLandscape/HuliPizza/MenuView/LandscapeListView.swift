//
//  LandscapeListView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/20/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct LandscapeListView: View {
    @State var selectedItem:MenuItem = testMenuItem
    @ObservedObject var orderModel:OrderModel
    var menuList = MenuModel().menu
    var body: some View {
        
        VStack {
             ListHeaderView(orderModel:orderModel,text:"Menu")
            HStack {
                VStack {
                    List(menuList) { item in
                        MenuRowView(menuItem: item)
                            .onTapGesture {
                                self.selectedItem = item
                        }
                    }
                    .frame(minHeight:400,maxHeight:2048)
                }
                MenuDetailView(orderModel:self.orderModel,menuItem:selectedItem)
            }
        }
    }
}

struct PortraitListView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeListView(orderModel:OrderModel())
    }
}
