//
//  NotificationView.swift
//  SwiftUIDefaultBasicAnimation
//
//  Created by Mohammad Azam on 9/21/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("Success")
        .padding()
            .foregroundColor(Color.white)
            .frame(width: UIScreen.main.bounds.width - 10, height: 100)
            .background(Color.green)
        .cornerRadius(20)
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
