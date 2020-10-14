//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/14/20.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(_ sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch  {
            print ("Error: Couldnt find the sound file")
        }
    }
}
