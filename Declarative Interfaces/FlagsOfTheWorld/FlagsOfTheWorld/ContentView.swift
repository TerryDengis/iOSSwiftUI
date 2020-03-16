//
//  ContentView.swift
//  FlagsOfTheWorld
//
//  Created by Terry Dengis on 11/8/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let flags = ["🇦🇽", "🇨🇦", "🇫🇮", "🇺🇸", "🇵🇹", "🇻🇬"]
    
    @State private var flagVM = FlagViewModel ()
    
    var body: some View {
        List {
            Text(self.flagVM.country)
            
            ForEach (self.flags, id: \.self) { flag in
                
                HStack {
                    Text(flag)
                        .font(.custom("Arial", size: 100))
                    Spacer ()
                }
                    .onTapGesture {
                        self.flagVM.showModal.toggle()
                        self.flagVM.flag = flag
                    }

            } .sheet(isPresented: self.$flagVM.showModal) {
                FlagDetailView (flagVM: self.$flagVM)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

