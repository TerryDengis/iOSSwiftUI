//
//  SettingsViewModel.swift
//  SwiftIntSwiftUI
//
//  Created by Mohammad Azam on 9/3/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
    
}
