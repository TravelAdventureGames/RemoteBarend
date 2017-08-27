//
//  tweedeGezegdeViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 12-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class tweedeGezegdeViewController: UIViewController {

    
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ant1Label: UIButton!
    @IBOutlet var ant2Label: UIButton!
    @IBOutlet var ant3Label: UIButton!
    @IBOutlet var gezegdeLabel: UILabel!
    
    

var antStat = String()

    @IBAction func buttonFalse1(sender: AnyObject) {
        antStat = "Dat antwoord was fout! 'Je moet roeien met de riemen die je hebt' is het juiste antwoord. Het betekent dat je het zult moeten doen met de middelen die je tot je beschikking hebt. Ga naar het volgende scherm voor het tweede gedeelte van de opdracht."
        performSegueWithIdentifier("toNext", sender: self)

        MyPlayer.playIt("error", ext: "wav")
        
    }
    
    
    @IBAction func buttonGoed(sender: AnyObject) {
        antStat = "Heel slim! 'Je moet roeien met de riemen die je hebt' is inderdaad het juiste antwoord. Het betekent dat je het zult moeten doen met de middelen die je tot je beschikking hebt. 10 punten verdiend! Druk snel op volgende voor het tweede gedeelte van deze opdracht!"


        score = score + 10
        MyPlayer.playIt("win", ext: "wav")
        performSegueWithIdentifier("toNext", sender: self)
    }
    
    @IBAction func buttonFalse2(sender: AnyObject) {
        antStat = "Dat antwoord was fout! 'Je moet roeien met de riemen die je hebt' is het juiste antwoord. Het betekent dat je het zult moeten doen met de middelen die je tot je beschikking hebt. Ga naar het volgende scherm voor het tweede gedeelte van de opdracht."
        performSegueWithIdentifier("toNext", sender: self)

        MyPlayer.playIt("error", ext: "wav")
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score \(score)"
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true

        gezegdeLabel.text = "En voor nog een keer 10 florijnen. Welk spreekwoord wordt hier uitgebeeld?"
    
        
        ant1Label.setTitle("Je moet roeien met de\nriemen die je hebt", forState: UIControlState.Normal)
        ant1Label.layer.cornerRadius = 5
        ant1Label.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.8)
        ant1Label.layer.shadowColor = UIColor.grayColor().CGColor
        ant1Label.layer.shadowOpacity = 1.0
        ant1Label.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        ant1Label.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        ant1Label.titleLabel!.font = UIFont(name: "Helveticaneue-Bold", size: 14)
        ant1Label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        ant1Label.titleLabel?.textAlignment = NSTextAlignment.Center

        
        ant3Label.setTitle("Wie roeit aan één kant van de boot\nmaakt zeker cirkels in de sloot", forState: UIControlState.Normal)
        ant3Label.layer.cornerRadius = 5
        ant3Label.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.8)
        ant3Label.layer.shadowColor = UIColor.grayColor().CGColor
        ant3Label.layer.shadowOpacity = 1.0
        ant3Label.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        ant3Label.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        ant3Label.titleLabel!.font = UIFont(name: "Helveticaneue-Bold", size: 14)
        ant3Label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        ant3Label.titleLabel?.textAlignment = NSTextAlignment.Center



    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toNext" {
            
            segue.destinationViewController as! GezegdeAntw2VC
            let dvc = segue.destinationViewController as! GezegdeAntw2VC
            dvc.antStatus = antStat
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
var antwoord = tweedeGezegdeViewController()
