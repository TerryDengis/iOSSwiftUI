//
//  StockListView.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct StockListView: View {
  // MARK: - PROPERTIES
  let stocks: [StockViewModel]
  
    var body: some View {
      List(stocks, id: \.symbol) { stock in
        StockCellView(stock: stock)
      }
    }
}

struct StockCellView: View {
  // MARK: - PROPERTIES
  let stock: StockViewModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(stock.symbol)
          .font(.system(.headline))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.bottom, 11)
          .padding(.top, 0)
        Text(stock.description)
          .font(.system(.body))
          .foregroundColor(.gray)
      }
      Spacer()
      VStack {
        Text(stock.price)
          .font(.system(.headline))
          .foregroundColor(.white)
        Button(stock.change){}
          .frame(width: 75)
          .padding (5)
            .background(Color.red)
            .foregroundColor(.white)
          .cornerRadius(6)
        
      }
    }
  }
}
struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
      
      let stock = Stock(symbol: "GOOG", description: "Google Stock", price: 1100, change: "+0.23")
      return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
