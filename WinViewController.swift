//
//  WinViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 04-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation


class WinViewController: UIViewController {

    
    //var text1: String = "Oh nee!!! Jullie hebben het niet gehaald... Jullie hebben natuurlijk wel vreselijk jullie best gedaan, maar het heeft niet geholpen. Mijn lieverd moet de zee op.."
    //var text2: String = "En ook jullie moeten mee naar de Oost. Al is de kans klein, ik hoop jullie toch ooit weer te zien! Laten we maar zeggen; Tot de volgende keer en vaarwel!"
    
    
    var counter = 0
    @IBOutlet var whatsappImage: UIImageView!
    @IBOutlet var teamFoto: UIImageView!
    @IBAction func swipeLeft(sender: AnyObject) {
        volgendeButt(self)
    }
    @IBAction func volgendeButt(sender: AnyObject) {
        if counter == 0 {
        counter++
        whatsappImage.image = UIImage(named: "winst2Nieuw.png")
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Griet", withExtension: "mp3")!
                
                do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
                    
                } catch _ {
                    
                    return //if it doesn't exist, don't play it
                }
                bgMusic.numberOfLoops = 0
                bgMusic.prepareToPlay()
                bgMusic.play()
                
            }, completion: nil)
        } else {
            performSegueWithIdentifier("naarEind", sender: self)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamFoto.image = teampje
        MyPlayer.playIt("cheering", ext: "mp3")
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "winst1.png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Barendt", withExtension: "mp3")!
                
                do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
                    
                } catch _ {
                    
                    return //if it doesn't exist, don't play it
                }
                bgMusic.numberOfLoops = 0
                bgMusic.prepareToPlay()
                bgMusic.play()
                
            }, completion: nil)
        
    }


}
