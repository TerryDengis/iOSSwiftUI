//
//  ImageDectionViewModel.swift
//  ImageClassifier
//
//  Created by Terry Dengis on 11/10/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation
import UIKit

class ImageDetectionViewModel: ObservableObject {
    
    var name: String = ""
    var manager: ImageDetectionManager
    @Published var predictionLabel: String = ""
    
    init (manager: ImageDetectionManager) {
        self.manager = manager
    }
    
    func detect (_ name: String) {
        // resize image
        let originalImage = UIImage (named: name)
        guard let resizedImage = originalImage?.resizeImage(target: CGSize(width: 224, height: 224)) else {
            fatalError("Unable to resize image")
        }
        
        // detect the image
        if let prediction = manager.detect(resizedImage) {
            // update the prediction label wit the image prediction
            self.predictionLabel = prediction
        }
    }
}
