//
//  entrpotUitlegViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 20-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class entrpotUitlegViewController: UIViewController {

    //var textArr = ["Jullie staan hier op het Entrepotdok, één van mijn lievelingsplekjes in Amsterdam met een rij van 84 pakhuizen, waarvan de eerste al in 1708 werd gebouwd. De pakhuizen werden vanaf 1827 eigenlijk als tijdelijke rijksopslag voor allerlei goederen gebruikt om het betalen van invoerbelasting te vermijden.", "Het ging toen namelijk niet zo goed met Amsterdam.. In de jaren 80 van de vorige eeuw waren de pakhuizen vervallen en werden ze bewoond door krakers. De krakers wimpelden een aanbod van de gemeente af om de panden voor een prikkie te gaan bewonen, ze vonden het te ver uit het centrum.", "Bijna niet te geloven, want in de huidige tijd kosten de huizen een redelijk godsvermogen..! Er wacht jullie hier een spannende opdracht die jullie binnen 6 minuten moeten volbrengen. Ben je er klaar voor? Druk dan op 'volgende!'"]
    
    var textArr = ["Jullie staan hier op het Entrepotdok, één van de mooiste plekjes van Amsterdam met een rij van 84 pakhuizen, waarvan de eerste al in 1708 wordt gebouwd. In de jaren 80 van de vorige eeuw zijn de pakhuizen helemaal vervallen en worden ze bewoond door krakers.", "Deze krakers wimpelen een aanbod van de gemeente af om de panden voor een prikkie te gaan bewonen, want ze vinden het te ver uit het centrum. Bijna niet te geloven, want in de huidige tijd kosten de huizen een godsvermogen..! Er wacht jullie hier een spannende opdracht die jullie binnen 10 minuten moeten volbrengen!"]
    
    
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
            
            let toImage = UIImage(named:"entrepot\(counter + 1).jpg")

                UIView.transitionWithView(self.imageSchreiers,
                    duration:1.5,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 3 {
                self.performSegueWithIdentifier("toEntrepot", sender: nil)
                
                
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "entrepot2.jpg")
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
        let alert1 = UIAlertController(title: "Entrepotdok!", message: "Je bent in de buurt van entrepotdok. Hier wacht jullie een cryptische opdracht dus ga snel verder!", preferredStyle: UIAlertControllerStyle.Alert)
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
