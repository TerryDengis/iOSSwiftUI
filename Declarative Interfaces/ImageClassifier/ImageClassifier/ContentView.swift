//
//  ContentView.swift
//  ImageClassifier
//
//  Created by Terry Dengis on 11/10/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    let images = ["dog2", "cat1", "dog", "tree", "mountains"]
    @State private var selectedImage = ""
    
    @ObservedObject private var imageDetectionVM: ImageDetectionViewModel
    private var imageDetectionManger: ImageDetectionManager
    
    init () {
        imageDetectionManger = ImageDetectionManager ()
        imageDetectionVM = ImageDetectionViewModel(manager: imageDetectionManger)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView ([.horizontal]) {
                    HStack {
                        ForEach (self.images, id: \.self) { name in
                            Image(name)
                                .resizable()
                                .frame (width:300, height:300)
                                .padding()
                                .onTapGesture {
                                    self.selectedImage = name
                                }
                                .border(Color.black, width: self.selectedImage == name ? 10: 0)
                        }
                    }
                }
                Button ("Detect") {
                    self.imageDetectionVM.detect (self.selectedImage)
                }
                .padding()
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                Text(self.imageDetectionVM.predictionLabel)
                    .font(.headline)
                    .padding()
            }
            .navigationBarTitle("Image Classifier")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
