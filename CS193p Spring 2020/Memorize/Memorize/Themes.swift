//
//  Themes.swift
//  Memorize
//
//  Created by Terry Dengis on 8/10/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

 struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var numberOfPairs: Int?
}

let themes: [Theme] = [
    Theme (
        name: "Halloween",
        emojis: ["👻","🎃","🕷","☠️","😱","🦇","💀","👿","👽"],
        color: .orange
    ),
    Theme (
        name: "Sports",
        emojis: ["⚽️","🏀","🏈","🏐","🎱","⛳️","🏑","🎳","🥌","⛸"],
        color: .blue
    ),
    Theme (
        name: "Flags",
        emojis: ["🇩🇿","🇦🇹","🇩🇲","🇬🇷","🇯🇵","🇺🇾","🇺🇸","🇹🇷","🇧🇪","🇨🇦","🇹🇨","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇧🇷"],
        color: .red
    ),
    Theme (
        name: "Animals",
        emojis: ["🐶","🐱","🐭","🦊","🐻","🐮","🐷","🐸","🐧","🙊","🐌"],
        color: .green
    ),
    Theme (
        name: "Food",
        emojis: ["🍎","🥨","🍭","🍪","🍕","🍔","🍌","🍆","🧅","🎂","🍦","🥓"],
        color: .pink
    ),
    Theme (
        name: "Places",
        emojis: ["🗽","🗿","🏝","🏔","🕌","🗼","⛩","🏖"],
        color: .purple
    ),
    Theme (
        name: "Faces",
        emojis: ["😀","😋","😏","😫","🤯","😥","😬"],
        color: .yellow,
        numberOfPairs: 7
    ),
]
