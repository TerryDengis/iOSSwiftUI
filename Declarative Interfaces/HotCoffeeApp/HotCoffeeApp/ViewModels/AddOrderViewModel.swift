//
//  AddOrderViewModel.swift
//  HotCoffeeApp
//
//  Created by Terry Dengis on 11/9/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

class AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    func saveOrder () {
        CoreDataManager.shared.saveOrder(name: name, type: type)
    }
}
