//
//  AddOrderView.swift
//  HotCoffeeApp
//
//  Created by Terry Dengis on 11/9/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    @Binding var isPresented: Bool
    @State var addOrderVM = AddOrderViewModel ()
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    TextField("Enter name", text: $addOrderVM.name)
                    Picker (selection: self.$addOrderVM.type, label: Text("")) {
                        Text ("Cappuccino").tag("cap")
                        Text ("Regular ").tag("reg")
                        Text ("Espresso").tag("ex")
                    } .pickerStyle(SegmentedPickerStyle ())
                    
                    Button("Place Order") {
                        self.addOrderVM.saveOrder ()
                        //onDismiss is not being called automatically
                        //self.isPresented = false
                        
                    }.padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }.padding()
        }.navigationBarTitle("Add Order")
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(true))
    }
}
