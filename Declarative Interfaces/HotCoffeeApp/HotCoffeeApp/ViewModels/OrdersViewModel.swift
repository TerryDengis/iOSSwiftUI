//
//  OrdersViewModel.swift
//  HotCoffeeApp
//
//  Created by Terry Dengis on 11/9/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
//import Combine

class OrdersViewModel: ObservableObject {
    @Published var orders = [OrderViewModel] ()
    
    init () {
        fetchOrders()
    }
    
    func fetchOrders () {
        orders = CoreDataManager.shared.fetchOrders().map(OrderViewModel.init)
    }
    
    func deleteOrder (_ orderVM: OrderViewModel) {
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchOrders ()
    }
}

class OrderViewModel {
    
    var name = ""
    var type = ""
    
    init (order: Order) {
        name = order.name!
        type = order.type!
    }
}
