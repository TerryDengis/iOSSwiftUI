//
//  NewsArticleViewModel.swift
//  Stocks
//
//  Created by Terry Dengis on 5/3/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation

struct NewsArticleViewModel {
  let article: Article
  
  var title: String {
    return self.article.title
  }
  
  var publication: String {
    return self.article.publication.uppercased()
  }
  
  var imageURL: String {
    return self.article.imageURL
  }
  

}
