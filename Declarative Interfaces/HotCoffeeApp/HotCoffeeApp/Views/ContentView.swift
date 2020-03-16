//
//  ContentView.swift
//  HotCoffeeApp
//
//  Created by Terry Dengis on 11/9/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var ordersVM = OrdersViewModel ()
    @State private var isPresented : Bool = false
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let orderVM = self.ordersVM.orders [index]
            ordersVM.deleteOrder(orderVM)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach (self.ordersVM.orders, id:\.name) { order in
                    HStack {
                        Image(order.type)
                            .resizable ()
                            .frame (width: 100, height:100)
                            .cornerRadius (10)
                        
                        Text (order.name)
                            .font(.largeTitle)
                            .padding (10)
                    }
                }.onDelete(perform: delete)
            }
            .sheet (isPresented: $isPresented, onDismiss: {
                self.ordersVM.fetchOrders()
            }, content: {
                AddOrderView (isPresented: self.$isPresented)
            })
            .navigationBarTitle ("Coffee Orders")
            .navigationBarItems (trailing: Button("Add New Order") {
                self.isPresented = true
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
