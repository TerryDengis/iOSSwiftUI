//
//  ContentView.swift
//  GoodWeather
//
//  Created by Terry Dengis on 10/30/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init () {
        weatherVM = WeatherViewModel ()
        
    }
    
    var body: some View {
        VStack (alignment: .center) {
            TextField ("Enter City name", text: $weatherVM.cityName) {
                self.weatherVM.search()
            }
            .font (.largeTitle)
            .padding()
            .fixedSize()
            
            Text (weatherVM.temperature)
                .font(.largeTitle)
                .foregroundColor(.white)
                .offset(y:50)
                .padding()
            
            Text (weatherVM.humidity)
                .font(.largeTitle)
                .foregroundColor(.white)
                .offset(y:100)
                .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
