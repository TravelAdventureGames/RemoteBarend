//
//  HortusuitlegViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 26-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class HortusuitlegViewController: UIViewController {

    //var textArr = ["Jullie staan hier op het Entrepotdok, één van mijn lievelingsplekjes in Amsterdam met een rij van 84 pakhuizen, waarvan de eerste al in 1708 werd gebouwd. De pakhuizen werden vanaf 1827 eigenlijk als tijdelijke rijksopslag voor allerlei goederen gebruikt om het betalen van invoerbelasting te vermijden.", "Het ging toen namelijk niet zo goed met Amsterdam.. In de jaren 80 van de vorige eeuw waren de pakhuizen vervallen en werden ze bewoond door krakers. De krakers wimpelden een aanbod van de gemeente af om de panden voor een prikkie te gaan bewonen, ze vonden het te ver uit het centrum.", "Bijna niet te geloven, want in de huidige tijd kosten de huizen een redelijk godsvermogen..! Er wacht jullie hier een spannende opdracht die jullie binnen 6 minuten moeten volbrengen. Ben je er klaar voor? Druk dan op 'volgende!'"]
    
    var textArr = ["De Hortus Botanicus is een botanische tuin die in 1638 wordt aangelegd als 'Hortus Medicus', (een tuin met medicinale planten) voor chirurgijns en apothekers. De VOC speelt een grote rol bij het uitbreiden van de collectie planten en bloemen.", "Als in de 17e eeuw de prijs van koffiebonen te hoog wordt, brengt de VOC koffiebonen naar Nederland. In de Hortus groeien de bonen uit tot prachtige koffieplanten, zodat Nederland dus zelf koffie kan verbouwen! Tegenwoordig herbergt de tuin meer dan zesduizend tropische en inheemse bomen en planten."]
    
    
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
            
            let toImage = UIImage(named:"hortus\(counter).jpg")
            
                UIView.transitionWithView(self.imageSchreiers,
                    duration:1.5,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 3 {
                self.performSegueWithIdentifier("toHortus", sender: nil)
                
                
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "hortus1.jpg")
        labelText.text = textArr[counter - 1]

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*override func viewDidAppear(animated: Bool) {
        let alert1 = UIAlertController(title: "Hortus Botanicus!", message: "Je bent in de buurt van de Hortus. Hier wacht jullie een opdracht dus ga snel verder!", preferredStyle: UIAlertControllerStyle.Alert)
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
