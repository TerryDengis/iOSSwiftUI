//
//  ContentView.swift
//  MoonShot
//
//  Created by Terry Dengis on 11/7/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode ("astronauts.json")
    let missions: [Mission] = Bundle.main.decode ("missions.json")

    var body: some View {
        NavigationView {
            List (missions) {mission in
                NavigationLink (destination: MissionView (mission: mission, astronauts: self.astronauts)) {
                    Image (mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack (alignment: .leading) {
                        Text (mission.displayName)
                            .font (.headline)
                        Text (mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}