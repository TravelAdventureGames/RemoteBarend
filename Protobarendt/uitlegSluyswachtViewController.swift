//
//  uitlegSluyswachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 26-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore

class uitlegSluyswachtViewController: UIViewController {

    var textArr = ["Vanaf het sluisje bij café De Sluyswacht heb je een prachtig uitzicht op de Oude Schans, een gracht die in de Gouden Eeuw rechtstreeks naar het IJ leidt. Het is in de VOC-tijd een komen en gaan van VOC-schepen die hun waren komen laden en lossen bij de pakhuizen die hier staan. Er worden vooral kruiden opgeslagen die door VOC-schepen uit Azië worden gehaald.", "In die tijd worden in Europa bij het koken nog nauwelijks kruiden gebruikt. Dat verandert in de Gouden Eeuw, maar door de enorme reis die de schepen moeten maken, kosten kruiden een fortuin! En wist je dat daar de uitdrukking 'dat is peperduur' vandaan komt? Ga nu vlug naar een vraag over kruiden."]
    
    
    @IBOutlet var buttLabel: UIButton!
    var counter = 1
    
    
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        buttonPressed(self)
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        counter++
        
        if counter < 3 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            
            let toImage = UIImage(named:"sluys\(counter).jpg")
         
                UIView.transitionWithView(self.imageSchreiers,
                    duration:1.5,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 3 {
                self.performSegueWithIdentifier("toSluysopdracht", sender: nil)
                
                
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "sluys1.jpg")
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
        let alert1 = UIAlertController(title: "De Oudeschans!", message: "Je bent in de buurt van Cafe De Sluyswacht aan de Oudeschans. Er wacht een nieuwe opdracht, dus ga snel verder!", preferredStyle: UIAlertControllerStyle.Alert)
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
