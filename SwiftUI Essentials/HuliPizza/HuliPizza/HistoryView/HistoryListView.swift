//
//  HistoryListView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct HistoryListView: View {
    var historyModel = HistoryModel ()
    @Binding var imageID: Int
    
    var body: some View {
        NavigationView {
            List(historyModel.historyItems) { item in
                NavigationLink (destination:
                HistoryDetailView (historyItem: item, imageID: self.$imageID)) {
                    HistoryRowView (historyItem: item)
                }
            }
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView(imageID: .constant(0))
    }
}
