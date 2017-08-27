//
//  glazenUitlegViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 13-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class glazenUitlegViewController: UIViewController {

    //var textArr = ["Al in 1657 was de slingerklok door deze krullebol, Christaan Huygens uitgevonden. Zijn klok was alleen niet bruikbaar aan boord van een schip, omdat het schommelen de slinger van de klok zou ontregelen. Om toch te weten hoe laat het was, draaide men daarom ‘glazen’ aan boord.", "Deze glazen waren zandlopers die er precies een half uur over deden om door te lopen. Vervolgens keerde de roerganger het glas om en luidde de scheepsklok. Ook draaide luie roergangers stiekem de zandloper wel eens eerder om, zodat ze snel naar hun nest konden (LOL).", "Daarom werd het systeem dagelijks opnieuw ingesteld. Met behulp van een speciaal instrument, een sextant, werd bepaald wanneer de zon die dag op zijn hoogste stand stond. Het was dan 12:00 uur, de zandloper werd gekeerd en het systeem begon weer van voor af aan."]
    
    var textArr = ["Om te weten hoe laat het is, draait men in de VOC-tijd ‘glazen’ aan boord van een schip. Deze glazen zijn zandlopers die er precies een half uur over doen om door te lopen. Dan keert de roerganger het glas om en luidt de scheepsklok. Soms draait een luie zeeman de zandloper stiekem wel eens eerder om, zodat hij lekker naar bed kan (LOL).", "Daarom wordt het systeem dagelijks opnieuw ingesteld. Met behulp van een speciaal instrument, een sextant, wordt bepaald wanneer de zon die dag op zijn hoogste stand staat. Het is dan 12:00 uur, de zandloper wordt omgekeerd en het systeem begint weer van voor af aan."]
    
    
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
            
            let toImage = UIImage(named:"glazen\(counter + 1).jpg")

                UIView.transitionWithView(self.imageSchreiers,
                    duration:1.5,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 3 {
                self.performSegueWithIdentifier("naarGlas", sender: nil)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "glazen2.jpg")
        labelText.text = textArr[counter - 1]
        buttLabel.layer.cornerRadius = 3
        buttLabel.layer.shadowColor = UIColor.grayColor().CGColor
        buttLabel.layer.shadowOpacity = 0.8
        buttLabel.layer.shadowOffset = CGSizeMake(1.0, 1.0)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*override func viewDidAppear(animated: Bool) {
        let alert1 = UIAlertController(title: "Allrighty!", message: "Je bent in de buurt van het Scheepvaartmuseum, een gebouw uit 1556 dat oorspronkelijk een pakhuis was. Loop door de ingang naar de binnenplaats voor de volgende opdracht!", preferredStyle: UIAlertControllerStyle.Alert)
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
