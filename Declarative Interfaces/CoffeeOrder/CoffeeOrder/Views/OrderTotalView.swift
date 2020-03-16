//
//  OrderTotalView.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 11/1/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack (alignment: .center) {
            Spacer ()
            Text (String (format: "$%.2f", total))
                .font (.title)
                .foregroundColor(Color.green)
            Spacer ()
        }.padding(.all)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}

