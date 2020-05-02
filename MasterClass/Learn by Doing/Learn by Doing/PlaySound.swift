//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by Terry Dengis on 4/26/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import Foundation
import AVFoundation

// MARK: - AUDIO PLAYER
var audioPlayer: AVAudioPlayer?

func playSound (sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find or play the sound file!")
        }
    }
}


