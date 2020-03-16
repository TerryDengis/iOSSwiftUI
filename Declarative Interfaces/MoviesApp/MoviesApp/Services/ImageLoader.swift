//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Terry Dengis on 11/4/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    var downloadedImage: UIImage?
    let objectWillChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("The Image URL is not Correct")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.objectWillChange.send (nil)
                }
                return
            }
            self.downloadedImage = UIImage (data: data)
            DispatchQueue.main.async {
                self.objectWillChange.send (self)
            }

        }.resume ()
    }
    
}
