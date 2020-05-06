//
//  StockViewModel.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation

struct StockViewModel {
  // MARK: - PROPERTIES
  let stock: Stock
  
  var symbol: String {
    return self.stock.symbol.uppercased()
  }
  
  var description: String {
    return self.stock.description
  }
  
  var price: String {
    return String(format: "%.2f", self.stock.price)
  }
  
  var change: String {
    return self.stock.change
  }
}
