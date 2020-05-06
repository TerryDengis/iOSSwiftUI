//
//  ContentView.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - PROPERTIES
  @ObservedObject private var stockListVM = StockListViewModel()
  
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor.black
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UITableView.appearance().backgroundColor = UIColor.black
    UITableViewCell.appearance().backgroundColor = UIColor.black
    
    stockListVM.load()
  }
  
  var body: some View {
    
    let filteredStocks = stockListVM.searchTerm.isEmpty ? stockListVM.stocks : stockListVM.stocks.filter {$0.symbol.starts(with: stockListVM.searchTerm)}
    let date=Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    
    return NavigationView {
      ZStack (alignment: .leading){
        Color.black
        Text(dateFormatter.string(from: date))
          .font (.system(.largeTitle, design:.serif))
          .fontWeight (.bold)
          .foregroundColor(.gray)
          .padding(.leading, 20)
          .offset(y: -400)
        SearchView(searchTerm: self.$stockListVM.searchTerm)
          .offset(y: -350)
        StockListView(stocks: filteredStocks)
          .offset(y: 150)
        NewsArticleView(newsArticles: self.stockListVM.news,
            onDragBegin: { value in self.stockListVM.dragOffset = value.translation},
            onDragEnd: { value in
              if value.translation.height < 0 {
                self.stockListVM.dragOffset = CGSize(width: 0, height: 75)
              } else {
                self.stockListVM.dragOffset = CGSize(width: 0, height: 700)
              }
            })
            .animation(.spring())
            .offset(y: self.stockListVM.dragOffset.height)
      }
      .navigationBarTitle("Stocks")
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
