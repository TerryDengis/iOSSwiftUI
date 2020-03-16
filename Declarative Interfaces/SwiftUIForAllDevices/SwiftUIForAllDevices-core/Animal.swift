//
//  Animal.swift
//  SwiftUIForAllDevices
//
//  Created by Terry Dengis on 11/11/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct Animal: Hashable {
    let name: String
    let description: String
    let image: String
}

extension Animal {
    static var placeholder: Animal {
        return Animal(name: "", description: "", image: "")
    }
}
