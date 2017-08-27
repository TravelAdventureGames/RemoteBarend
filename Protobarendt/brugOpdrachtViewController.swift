//
//  brugOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 09-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class brugOpdrachtViewController: UIViewController {

    
    @IBOutlet var volgende: UIBarButtonItem!
    @IBOutlet var buttLabel: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var inputLabel: UITextField!
    @IBOutlet var vraagLabel: UILabel!
    
    var ansGiven = false
    var correctAnswer = "1045"
    
    @IBAction func swipeLeft(sender: AnyObject) {
        if ansGiven == true && inputLabel.text != correctAnswer {
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    @IBAction func checkButton(sender: AnyObject) {
        ansGiven = true
        inputLabel.resignFirstResponder()
        buttLabel.enabled = false
        buttLabel.hidden = true
        inputLabel.enabled = false
        
        if inputLabel.text == "1045" {
            
            MyPlayer.playIt("win", ext: "wav")
            score = score + 15
            scoreLabel.text = "Score \(score)"
            
            performSegueWithIdentifier("naarOostindisch", sender: nil)
 
        } else {
            MyPlayer.playIt("error", ext: "wav")
            scoreLabel.text = "Score \(score)"
            vraagLabel.text = "Hmm, dat was fout... Schijnbaar hebben jullie ons slot niet gevonden of de foute code ingetypt. Ga naar het volgende scherm voor de laatste locatie. Maar helaas dus geen punten verdiend."
            
            volgende.enabled = true
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputLabel.keyboardType = .NumberPad
        scoreLabel.text = "Score \(score)"
        
        volgende.enabled = false

        
        vraagLabel.text = "Het slot van Barendt en Aaltje is een groter slot dan de rest van de slotjes die aan deze brug hangen. Het slot heeft een holle behuizing die je kunt openen met de code '0531'. \n\rAls je het slot hebt geopend vind je een geheime code. Vul deze in en open de weg naar de laatste locatie! \n\rLet op; Dit slot is een 'geocache' (een soort schat). Laat het slot daarom achter zoals je deze hebt gevonden. Zo kunnen andere schatzoekers hem ook vinden! "
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
