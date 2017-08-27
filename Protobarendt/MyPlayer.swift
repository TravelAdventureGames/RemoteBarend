//
//  MyPlayer.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 04-12-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayItNow {
    
    var bgMusic:AVAudioPlayer = AVAudioPlayer()
    
    func playIt(name: String, ext: String) {
        let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource(name, withExtension: ext)!
        
        do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
            
        } catch _ {
            
            return //if it doesn't exist, don't play it
        }
        bgMusic.numberOfLoops = 0
        bgMusic.prepareToPlay()
        bgMusic.play()
        
    }
}

var MyPlayer = PlayItNow()