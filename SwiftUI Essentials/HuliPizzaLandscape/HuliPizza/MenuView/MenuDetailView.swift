//
//  MenuDetailView.swift
//  Pizza
//
//  Created by Steven Lipton on 9/2/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`
struct MenuDetailView: View {
    @Environment(\.verticalSizeClass) var sizeClass
    @EnvironmentObject var settings:UserPreferences
    @ObservedObject var orderModel:OrderModel
    @State var didOrder:Bool = false
    @State var quantity:Int = 1
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * settings.size.rawValue)
    }
    func addItem(){
//        orderModel.add(menuID: menuItem.id)
        didOrder = true
    }
    

    
    var body: some View {
        VStack(spacing:3) {
            PageTitleView(title: menuItem.name)
            
            ZStack{
                SelectedImageView(image: "\(menuItem.id)_250w")
                    .frame(minWidth:100,maxWidth:200)
                    .padding(10)
                Button(action: addItem) {
                    Text("Add to order")
                        .font(sizeClass == .regular ? .title : .body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $didOrder){
                    ConfirmView(menuID: self.menuItem.id, isPresented: self.$didOrder, orderModel:self.orderModel, quantity: self.$quantity,size:self.$settings.size)
                }
            }.layoutPriority(2)
            Text(menuItem.description)
                .lineLimit(5)
              //  .padding(3)
                .layoutPriority(3)
                
            //Spacer()
            Group{
            SizePickerView(size:$settings.size)
            QuantityStepperView(quantity:$quantity)
            HStack{
                Text("Order:  \(formattedPrice)")
                    .font(.headline)
                Spacer()
                Text("Order total: " + orderModel.formattedTotal )
                    .font(.headline)
            }
        }
            Spacer()
        }.frame(minHeight:300,maxHeight:2732)
        
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel:OrderModel(),menuItem: testMenuItem)
    }
}

struct QuantityStepperView: View {
   
    @Binding var quantity:Int
    var body: some View {
        Stepper(value: $quantity, in: 1...10){
            Text("Quantity \(quantity)")
        }
    }
}

struct SizePickerView: View {
    @Binding var size:Size
    let sizes:[Size] = [.small,.medium,.large]
    var body: some View {
        Picker(selection:$size, label:Text("Pizza Size")){
            ForEach(sizes, id:\.self){ size in
                Text(size.formatted()).tag(size)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.headline)
    }
}
