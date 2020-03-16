//
//  AnimalList.swift
//  SwiftUIDefaultBasicAnimation
//
//  Created by Mohammad Azam on 9/23/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AnimalDetail: View {
    
    let animal: String
    
    var body: some View {
        VStack {
            Text(animal)
                .font(.custom("Arial",size: 200))
        }
    }
    
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct AnimalList: View {
    
    //let animals = ["🐈","🦒","🐆","🐀","🦏","🐪"]
    
    @State private var showDetails: Bool = false
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: self.$showDetails) {
                Text("Show/Hide Details")
            }.fixedSize()
            
            if self.showDetails {
                Text("Some Text").transition(.move(edge: .trailing))
            }
           
            
        }
    }
}

struct AnimalList_Previews: PreviewProvider {
    static var previews: some View {
        AnimalList()
    }
}
