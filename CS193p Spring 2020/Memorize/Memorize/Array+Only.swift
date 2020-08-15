//
//  Array+Only.swift
//  Memorize
//
//  Created by Terry Dengis on 8/10/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
