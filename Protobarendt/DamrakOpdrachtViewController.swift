//
//  DamrakOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 29-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

var score = Int()

class DamrakOpdrachtViewController: UIViewController {
    
var buttonTapped = false
var ansGiven = false
    

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var buttonOutlet: UIButton!
    @IBOutlet var buttonImage: UIButton!
    
    let image = UIImage(named: "Damschavot2.png") as UIImage!
    var imageView = UIImageView()
    var antStat = String()

    
    
    @IBAction func enlargeButton(sender: AnyObject) {
        
        
        if buttonTapped == false {
            goedAntwoordTekst.hidden = true
            foutAntwoord1Tekst.hidden = true
            foutAntwoord2Tekst.hidden = true
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .ScaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = image
            imageView.center = view.center
            view.addSubview(imageView)

            buttonTapped = true
            
        } else {
            goedAntwoordTekst.hidden = false
            foutAntwoord1Tekst.hidden = false
            foutAntwoord2Tekst.hidden = false
            imageView.hidden = true

            buttonTapped = false
        }
    }
    
    @IBOutlet var label1: UILabel!

    @IBOutlet var goedAntwoordTekst: UIButton!
    @IBOutlet var foutAntwoord2Tekst: UIButton!
    @IBOutlet var foutAntwoord1Tekst: UIButton!
    //button gemaakt om actie te creeren zodat we kunnen triggeren dat de image groter wordt.


    @IBAction func goedAntwoord(sender: AnyObject) {
        MyPlayer.playIt("win", ext: "wav")
        antStat = "Heel goed, 10 florijnen verdiend! Er zitten inderdaad 9 gevulde gaten in het Paleis op de Dam. Het paleis is midden in de Gouden Eeuw gebouwd als stadhuis van Amsterdam. \n\nGa snel naar het volgende scherm voor nog een vraag voor 10 florijnen."
        performSegueWithIdentifier("toNext", sender: self)
        score = score + 10

       
        
    }
    
    @IBAction func foutAntwoord1(sender: AnyObject) {
        MyPlayer.playIt("error", ext: "wav")
 
        antStat = "Oei fout, geen florijnen verdiend! Er zitten 9 gevulde gaten in het Paleis op de Dam. Het paleis is midden in de Gouden Eeuw gebouwd als stadhuis van Amsterdam. \n\nNiet getreurd, want jullie krijgen nog een kans. Ga snel naar het volgende scherm!"
        performSegueWithIdentifier("toNext", sender: self)

        
    }
    
    @IBAction func foutAntwoord2(sender: AnyObject) {
        MyPlayer.playIt("error", ext: "wav")
        antStat = "Oei fout, geen florijnen verdiend! Er zitten 9 gevulde gaten in het Paleis op de Dam. Het paleis is midden in de Gouden Eeuw gebouwd als stadhuis van Amsterdam. \n\nNiet getreurd, want jullie krijgen nog een kans. Ga snel naar het volgende scherm!"
        performSegueWithIdentifier("toNext", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        label1.text = "Ergens op dit plein vind je dichtgemetselde vakjes zoals weergegeven op de foto (aangegeven met de pijl). Kun je deze vakjes vinden? Zo ja, hoeveel van deze vakjes tel je? (Tip: klik op de foto om deze te vergroten)"

        scoreLabel.text = "score \(score)"
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toNext" {
            
            segue.destinationViewController as! Antwoord1DamViewController
            let dvc = segue.destinationViewController as! Antwoord1DamViewController
            dvc.antStatus = antStat
            
        }
        
    }


}
