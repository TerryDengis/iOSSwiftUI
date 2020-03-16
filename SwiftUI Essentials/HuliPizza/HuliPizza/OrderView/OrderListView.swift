//
//  OrderListView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    var orderModel: OrderModel
    
    var body: some View {
        VStack {
            
            List{
                Section (
                    header: ListHeaderView (orderModel: self.orderModel, text: "Your Order")
                ) {
                    ForEach (orderModel.orders) { item in
                        OrderRowView (orderItem: item)
                    }
                    .onDelete(perform: delete)
                }
            }
        }
    }
    
    func delete(at offsets:IndexSet){
        orderModel.orders.remove(atOffsets: offsets)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel ())
    }
}
