//
//  PlaySound.swift
//  SlotMachine
//
//  Created by Terry Dengis on 5/25/20.
//  Copyright © 2020 Terry Dengis. All rights reserved.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("ERROR: Could not find or play the sound file!")
    }
  }
}
