//
//  ThemeSettings.swift
//  ToDo
//
//  Created by Terry Dengis on 10/11/20.
//

import SwiftUI

final public class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(themeSettings, forKey: "Theme")
        }
    }
    private init() {}
    public static let shared = ThemeSettings()
}
