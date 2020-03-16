//
//  HistoryView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @State var imageID: Int = 0
    var body: some View {
        VStack {
            //ContentHeaderView ()
            PageTitleView(title: "Pizza History")
            SelectedImageView(image: "\(imageID)_250w")
                .padding()
            HistoryListView (imageID: self.$imageID)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            //.colorScheme(.dark)
            //.background(Color.black)

    }
}
