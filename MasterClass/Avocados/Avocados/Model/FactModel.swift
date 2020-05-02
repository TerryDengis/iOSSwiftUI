//
//  FactModel.swift
//  Avocados
//
//  Created by Terry Dengis on 4/30/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image : String
    var content: String
}
