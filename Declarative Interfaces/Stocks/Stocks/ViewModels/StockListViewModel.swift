//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {

  @Published var dragOffset: CGSize = CGSize(width: 0, height: 700)
  @Published var searchTerm: String = ""
  @Published var stocks: [StockViewModel] = [StockViewModel]()
  @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
  
  func load() {
    fetchStocks()
    fetchNews ()
  }
  
  private func fetchNews() {
    WebService().getTopNews { news in
      if let news = news {
        DispatchQueue.main.async {
          self.news = news.map(NewsArticleViewModel.init)
        }
          
      }
    }
  }
  
  private func fetchStocks() {
    WebService().getStocks { stocks in
      if let stocks = stocks {
        DispatchQueue.main.async {
          self.stocks = stocks.map(StockViewModel.init)
        }
      }
    }
  }
}
