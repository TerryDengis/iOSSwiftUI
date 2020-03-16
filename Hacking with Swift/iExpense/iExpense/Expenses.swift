//
//  Expenses.swift
//  iExpense
//
//  Created by Terry Dengis on 11/6/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID ()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem] () {
        didSet {
            let encoder = JSONEncoder ()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init () {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder ()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
