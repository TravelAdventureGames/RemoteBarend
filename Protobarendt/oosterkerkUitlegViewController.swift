//
//  oosterkerkUitlegViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 16-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class oosterkerkUitlegViewController: UIViewController {

    var textArr = ["De Oosterkerk wordt op Eerste Kerstdag 1671 geopend. Jullie staan op de Oostelijke eilanden, in de Gouden Eeuw het middelpunt van de Amsterdamse scheepsbouw. Er bevinden zich tientallen scheepswerven waar VOC-schepen in grote getalen worden gemaakt.","De bewoners van het eiland Kattenburg staan bekend als nogal onbehouwen ruziemakers en worden 'Bijltjes' genoemd, naar hun belangrijkste stuk gereedschap. Ga nu vlug naar de vraag over de Oosterkerk!"]
    
    
    var counter = 1
    
    
    @IBOutlet var buttLabel: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        buttonPressed(self)
    }
    @IBAction func buttonPressed(sender: AnyObject) {
         counter++
        
        if counter < 3 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
           
            let toImage = UIImage(named:"oosterkerk\(counter + 1).jpg")

                UIView.transitionWithView(self.imageSchreiers,
                    duration:1.5,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 3 {
                self.performSegueWithIdentifier("naarOosteropdracht", sender: nil)
                
                
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "oosterkerk2.jpg")
        labelText.text = textArr[counter - 1]

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*override func viewDidAppear(animated: Bool) {
        let alert1 = UIAlertController(title: "Een klein opdrachtje tussendoor!", message: "Nu je er toch bent, heb ik nog wel een leuke opdracht. Die gaat over de Oosterkerk waar je nu vlakbij staat. Ga dus snel verder!", preferredStyle: UIAlertControllerStyle.Alert)
        alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            
        }))
        
        self.presentViewController(alert1, animated: true, completion:nil)
        
        let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("ting", withExtension: "wav")!
        
        do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
            
        } catch _ {
            
            return //if it doesn't exist, don't play it
        }
        bgMusic.numberOfLoops = 1
        bgMusic.prepareToPlay()
        bgMusic.play()
        
        
        
    }*/
    
    
    

}
