//
//  Report.swift
//  BarGraph
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct Report: Hashable {
    let year: String
    let revenue: Double
    
    static func all() -> [Report] {
        
        return [
            Report (year: "2001", revenue: 2500),
            Report (year: "2002", revenue: 5600),
            Report (year: "2003", revenue: 8200)
        ]
    }
}
