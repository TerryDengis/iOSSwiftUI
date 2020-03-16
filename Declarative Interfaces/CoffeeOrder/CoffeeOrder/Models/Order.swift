//
//  Order.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 10/31/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct Order: Codable{
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
