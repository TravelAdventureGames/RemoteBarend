//
//  oosterkerkOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 20-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class oosterkerkOpdrachtViewController: UIViewController {

    var asnGiven = false
    @IBOutlet var buttLabel: UIButton!
    @IBOutlet var imageOoster: UIImageView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var buttonLabel: UIButton!
    @IBOutlet var volgende: UIBarButtonItem!
    @IBOutlet var gulden: UILabel!
    @IBOutlet var webLabel: opmaakButton!
    @IBAction func webButton(sender: AnyObject) {
        if let url = NSURL(string: "http://www.oosterkerk-amsterdam.nl/gebouw/") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func swipeLeft(sender: AnyObject) {
        if asnGiven == true {
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        asnGiven = true
        webLabel.hidden = true
       
        
        if input.text == "1" {
            MyPlayer.playIt("win", ext: "wav")
            score = score + 10
            scoreLabel.text = " Score \(score)"
            input.resignFirstResponder() // haalt keyboard weg na button press
            buttonLabel.hidden = true
            input.hidden = true
            volgende.enabled = true
            gulden.hidden = true
            
            
            textLabel.text = "Haha, jullie hebben het helemaal goed! De Oosterkerk werd voor het symbolische bedrag van maar één gulden gekocht in 1974! Jullie verdienen 10 maal dat bedrag, maar helaas voor jullie is dat maar 10 florijnen.Ga snel naar de volgende locatie op het Entrepotdok.."
        } else {
            MyPlayer.playIt("error", ext: "wav")
            input.resignFirstResponder() // haalt keyboard weg na button press
            buttonLabel.hidden = true
            input.hidden = true
            volgende.enabled = true
            gulden.hidden = true
            
            textLabel.text = "Tja, dat was jammer genoeg niet goed. De Oosterkerk werd voor het symbolische bedrag van maar één gulden gekocht in 1974! Ga snel verder naar de volgende locatie, misschien gaat dat beter.."
        }
    }


    

    override func viewDidLoad() {
        super.viewDidLoad()
        input.keyboardType = .NumberPad
        textLabel.text = "Na de gloriejaren van de VOC raakt de Oosterkerk in verval..  Gelukkig helpt een hulpactie van de buurt en in 1969 koopt de gemeente Amsterdam de kerk terug. \n\rWeten jullie voor hoeveel gulden de gemeente de kerk heeft gekocht in 1974? Verdien maar liefst 10 keer dat bedrag!! Gebruik 'Zoek Online' om het antwoord te vinden."

        scoreLabel.text = " Score \(score)"
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true
        volgende.enabled = false
        imageOoster.image = UIImage(named: "oosterkerk1.jpg")
        buttLabel.layer.cornerRadius = 5
        buttLabel.layer.shadowColor = UIColor.grayColor().CGColor
        buttLabel.layer.shadowOpacity = 0.8
        buttLabel.layer.shadowOffset = CGSizeMake(1.0, 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
