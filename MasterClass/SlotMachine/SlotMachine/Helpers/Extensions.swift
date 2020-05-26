//
//  Extensions.swift
//  SlotMachine
//
//  Created by Terry Dengis on 5/13/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import SwiftUI

extension Text {
  
  func scoreLabelStyle() -> Text {
    self
      .foregroundColor(.white)
      .font(.system(size:10, weight: .bold, design: .rounded))
  }
  
  func scoreNumberStyle() -> Text {
    self
      .foregroundColor(.white)
      .font(.system(.title, design: .rounded))
      .fontWeight(.heavy)
  }
}
