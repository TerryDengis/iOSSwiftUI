//
//  Coffee.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 10/31/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct Coffee {
    
    let name: String
    let imageURL: String
    let price: Double
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}

