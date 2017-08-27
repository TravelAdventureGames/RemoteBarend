//
//  DamopdrachtTweeViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 30-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class DamopdrachtTweeViewController: UIViewController {

    var antStat = String()
    

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var buttonTekst3: UIButton!
    @IBOutlet var buttonTekst2: UIButton!
    @IBOutlet var buttonTekst1: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var imageSchavot: UIImageView!
    
    @IBAction func buttonFout1(sender: AnyObject) {
        MyPlayer.playIt("error", ext: "wav")
        antStat = "Fout! Het schavot wordt gebouwd voor de onthoofding van Johannes van Gogh. Johannes is chirurgijn (een soort dokter) en verloofd met de prostituee Anna. Als ze hem verlaat, steekt hij haar dood met een mes... Love hurts.."
        performSegueWithIdentifier("toNext", sender: self)
        
        
    }
    @IBAction func buttonFout2(sender: AnyObject) {
        MyPlayer.playIt("error", ext: "wav")
        antStat = "Fout! Het schavot wordt gebouwd voor de onthoofding van Johannes van Gogh. Johannes is chirurgijn (een soort dokter) en verloofd met de prostituee Anna. Als ze hem verlaat, steekt hij haar dood met een mes... Love hurts.."
        performSegueWithIdentifier("toNext", sender: self)
        
    }

    @IBAction func buttonGoed(sender: AnyObject) {
        MyPlayer.playIt("win", ext: "wav")
        antStat = "Goed, 10 florijnen verdiend (hij gaat lekker..)! Het schavot wordt gebouwd voor de onthoofding van Johannes van Gogh. Johannes is chirurgijn (een soort dokter) en verloofd met de prostituee Anna. Als ze hem verlaat, steekt hij haar dood met een mes... Love hurts."
        performSegueWithIdentifier("toNext", sender: self)
        score = score + 10


        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        label.text = "De gemetselde vakjes zijn de restanten van een groot bouwwerk dat in de Gouden Eeuw aan het paleis was gebouwd. Weten jullie wat voor bouwwerk dit was? Hint: Open Google op je smartphone en zoek op 'JBF van Gogh'!"
        imageSchavot.image = UIImage(named: "paleisDam.jpg") as UIImage!

     

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toNext" {
            
            segue.destinationViewController as! Antwoord2DamViewController
            let dvc = segue.destinationViewController as! Antwoord2DamViewController
            dvc.antStatus = antStat
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
