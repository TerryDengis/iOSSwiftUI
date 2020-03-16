//
//  URLImage.swift
//  MoviesApp
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader ()
    
    var placeHolder: Image
    
    init (url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeHolder = placeholder
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
        if let uiImage = self.imageLoader.downloadedImage {
            return Image(uiImage: uiImage)
        } else {
            return placeHolder
        }
        
    }
}

