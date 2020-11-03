//
//  Video.swift
//  Africa
//
//  Created by Terry Dengis on 10/27/20.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
