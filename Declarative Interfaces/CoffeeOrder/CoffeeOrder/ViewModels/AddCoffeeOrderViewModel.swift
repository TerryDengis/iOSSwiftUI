//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 11/1/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "medium"
    @Published var coffeeName: String = ""
    
    private var webService: WebService
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map (CoffeeViewModel.init)
    }
    
    init() {
        webService = WebService ()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder () {
        let order = Order (name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
    
        webService.createOrder(order: order) { _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["small":2.0, "medium":3.0, "large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice () -> Double {
        let coffeeVM = coffeeList.first {$0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            //return 100.0
            return  coffeeVM.price * priceForSize ()
        } else {
            return 0.0
        }
    }
}
