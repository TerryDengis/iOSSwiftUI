//
//  ContentView.swift
//  BarGraph
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BarGraphView(reports: Report.all())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
