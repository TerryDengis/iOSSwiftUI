//
//  OrderListViewModel.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 10/31/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel] ()
    
    init () {
        fetchOrders()
    }
    
    func fetchOrders () {
        WebService().getAllOrders(completion: {orders in
            if let orders = orders {
                self.orders = orders.map (OrderViewModel.init)
            }
            
        })
    }
}

class OrderViewModel {
    
    let id = UUID()
    var order: Order
    
    init (order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: Double {
        return order.total
    }
    
}
