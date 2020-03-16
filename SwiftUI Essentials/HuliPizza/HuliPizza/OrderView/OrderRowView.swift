//
//  OrderRowView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct OrderRowView: View {
    var orderItem: OrderItem
    var body: some View {
        VStack {
            HStack (alignment: .firstTextBaseline) {
                Image (systemName: "\(orderItem.id).square")
                Text(orderItem.description)
                    .font(.headline)
                Spacer ()
                Text (orderItem.formattedExtendedPrice)
                .bold()
            }
            Text (orderItem.comments)
            
        } .animation (.none)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(orderItem: testOrderItem)
    }
}
