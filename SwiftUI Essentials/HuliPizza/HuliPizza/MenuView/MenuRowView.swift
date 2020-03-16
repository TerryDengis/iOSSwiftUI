//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by Terry Dengis on 11/12/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct MenuRowView: View {
    var menuItem: MenuItem = testMenuItem
    
    var body: some View {
        VStack (alignment: .leading){
            HStack(alignment: .top, spacing: 13) {
                Image ("\(menuItem.id)_100w")
                    .cornerRadius(15)
                    //.border(Color ("G4"), width: 1)
                VStack (alignment: .leading)  {
                    Text(menuItem.name)
                        .font(.title)
                        .fontWeight (.light)
                    RatingsView (count: menuItem.rating)
        
                //Spacer ()
                }
            }
            Text (menuItem.description)
                .font(.body)
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(menuItem:MenuModel().menu[9])
    }
}
