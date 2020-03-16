//
//  AddCoffeeOrderView.swift
//  CoffeeOrder
//
//  Created by Terry Dengis on 11/1/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel ()
    
    var body: some View {
        NavigationView {
             VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField ("Enter name", text: self.$addCoffeeOrderVM.name)
                    }

                    Section(header: Text("SELECT COFFEE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        ForEach (addCoffeeOrderVM.coffeeList, id:\.name) {coffee in
                            CoffeeCellView(coffee: coffee, selection:self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE").font(.body)) {
                        Picker ("", selection: self.$addCoffeeOrderVM.size) {
                            Text ("Small").tag("small")
                            Text ("Medium").tag("medium")
                            Text ("Large").tag("large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button ("PlaceOrder") {
                        self.addCoffeeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }.padding(.all)
                    .foregroundColor(Color.white)
                    .background(Color(red:46/255, green: 204/255, blue: 113/255))
                .cornerRadius(10)
            }
            .navigationBarTitle ("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width:100, height:100)
                .cornerRadius (20)
            Text(coffee.name)
                .font(.title)
                .padding(.leading)
            Spacer ()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "")
            .padding()
        }
        .onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
