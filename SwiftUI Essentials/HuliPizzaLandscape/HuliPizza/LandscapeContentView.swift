//
//  LandscapeContentView.swift
//  HuliPizza
//
//  Created by Steven Lipton on 9/20/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI

struct LandscapeContentView: View {
    @State var isMenuDisplayed:Bool = true
    @ObservedObject var orderModel:OrderModel
    var body: some View {
         VStack {
            Button(action:{self.isMenuDisplayed.toggle()}){
                PageTitleView(title: "Order Pizza", isDisplayingOrders: isMenuDisplayed)
            }
            HStack{
                LandscapeListView(orderModel: orderModel)
                    .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
                OrderListView(orderModel: orderModel)
                    .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
                    .animation(.spring())
            }
         }
          .frame(minHeight:200,maxHeight:2732)
    }
}


struct ProtraitContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeContentView(orderModel: OrderModel())
        .previewDevice("iPad Pro (10.5-inch)")
    }
}
