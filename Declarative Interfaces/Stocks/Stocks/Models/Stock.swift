//
//  Stock.swift
//  Stock
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation

struct Stock: Decodable {
  var symbol: String
  var description: String
  var price: Double
  var change: String
}
