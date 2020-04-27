//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Terry Dengis on 4/26/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
