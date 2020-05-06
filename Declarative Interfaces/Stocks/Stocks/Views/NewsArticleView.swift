//
//  NewsArticleView.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
  let newsArticles: [NewsArticleViewModel]
  let onDragBegin: (DragGesture.Value) -> Void
  let onDragEnd: (DragGesture.Value) -> Void
  let screenSize = UIScreen.main.bounds.size
  var body: some View {
    
    VStack(alignment: .leading) {
      HStack {
        VStack(alignment: .leading) {
          Text("Top News")
            .font (.system(.largeTitle, design:.serif))
            .fontWeight (.bold)
            .foregroundColor(.white)
            .padding(2)

          Text("From News")
            .font (.system(.body, design:.serif))
            .fontWeight (.bold)
            .foregroundColor(.gray)
            .padding(2)

        }
        Spacer()
      }
        .padding()
        .contentShape(Rectangle())
        .gesture(DragGesture()
        .onChanged(self.onDragBegin)
        .onEnded(self.onDragEnd))
      ScrollView {
        VStack{
          ForEach(self.newsArticles, id:\.title) { article in
            HStack {
              VStack(alignment: .leading) {
                Text(article.publication)
                  .font (.system(.body, design:.serif))
                  .fontWeight (.bold)
                  .foregroundColor(.white)
                
                Text(article.title)
                  .font (.system(.body, design:.serif))
                  .foregroundColor(.white)
              }
              URLImage(URL(string: article.imageURL)!, content:{$0.image.resizable()})
                .frame(width:100, height:100)
                .scaledToFit()
              Spacer()
            }
          }
        }
      }
      .frame(maxWidth: .infinity)
    }
    .frame(width: screenSize.width, height: screenSize.height)
    .background(Color(red: 27/255, green: 28/255, blue: 30/255))
    .cornerRadius(20)
  }
}


struct NewsArticleView_Previews: PreviewProvider {
  static var previews: some View {
    let news = Article(
      title: "The Bull Market is Charging into 2020",
      publication: "THE WALSTREET JOURNAL",
      imageURL: "https://i.ytimg.com/vi/gtkiRJwSN10/maxresdefault.jpg"
    )
    
    return NewsArticleView(newsArticles: [NewsArticleViewModel(article: news)], onDragBegin: { _ in }, onDragEnd: { _ in })
  }
}
