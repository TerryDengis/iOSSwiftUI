//
//  PostData.swift
//  HackerNews
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
