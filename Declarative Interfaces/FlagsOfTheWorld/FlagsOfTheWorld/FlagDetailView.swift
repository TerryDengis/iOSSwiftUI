//
//  FlagDetailView.swift
//  FlagsOfTheWorld
//
//  Created by Terry Dengis on 11/8/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct FlagDetailView: View {
    @Binding var flagVM: FlagViewModel
    
    var body: some View {
        VStack {
            Text (flagVM.flag)
                .font(.custom("Arial", size: 200))
            TextField ("Enter the contry name", text: $flagVM.country)
                .padding()
                .fixedSize()
            Button ("Submit") {
                self.flagVM.showModal.toggle()
            }
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flagVM: .constant(FlagViewModel()))
    }
}
