//
//  deAmsterdamViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 13-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class deAmsterdamViewController: UIViewController {

    //var textArr = ["Je staat hier aan de museumkade met prachtig uitzicht op het replica van ‘De Amsterdam’; een VOC-schip uit 1749 dat (net al de Titanic), ook al tijdens zijn allereerste afvaart ten onder ging.", "In een zuidwesterstorm strandde het schip dat op weg was naar de Indië, op het strand bij Hastings in Engeland. 50 bemanningsleden moesten dit wegens een epidemie-uitbraak met de dood bekopen.", "De lading bestond onder andere uit 27 kisten zilver die toen al een waarde had van 300 duizend euro. Er is ook een Suske en Wiske over dit avontuur verschenen, 'Angst op de Amsterdam'."]
    
    var textArr = ["Aan de overkant zie je een kopie van ‘De Amsterdam’; een VOC-schip uit 1749 dat (net als de Titanic), ook tijdens zijn allereerste reis vergaat bij Hastings in Engeland. 50 zeemannen moeten dit met de dood bekopen. De lading bestaat onder andere uit 27 kisten zilver die toen al een waarde hadden van 300 duizend euro."]
    
    
    var counter = 1
    
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        buttonPressed(self)
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("naarAmsterdam", sender: nil)
        
        /*if counter < 4 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            counter++
            let toImage = UIImage(named:"amsterdam\(counter).jpg")
            if counter < 4 {
                UIView.transitionWithView(self.imageSchreiers,
                    duration:1.5,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 4 {
                self.performSegueWithIdentifier("naarAmsterdam", sender: nil)
                
                
            }
            
        }*/
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "amsterdam1.jpg")
        labelText.text = textArr[counter - 1]
        volgende.layer.cornerRadius = 3
        volgende.layer.shadowColor = UIColor.grayColor().CGColor
        volgende.layer.shadowOpacity = 0.8
        volgende.layer.shadowOffset = CGSizeMake(1.0, 1.0)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
