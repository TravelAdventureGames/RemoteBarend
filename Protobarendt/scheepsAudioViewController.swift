//
//  scheepsAudioViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 07-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation


class scheepsAudioViewController: UIViewController {
   
    var textArr = ["Zoals het er nu naar uitziet, vaart onze held vanaf precies deze plek, over een maand het IJ op. Het eilandje Pampus ligt hier maar een paar kilometer vandaan. Veel schepen lopen daar vast op een zandbank. Vandaar de uitdrukking 'ik lig voor pampus'. Gelukkig was de scheepskameel uitgevonden."," Zoals jullie wel weten, was ons IJsselmeer voordat de afsluitdijk werd gebouwd, nog de ruige Zuiderzee.", "Als jullie niet genoeg florijnen verdienen, vaart Barendt via Texel en de Noordzee naar Batavia, tegenwoordig de stad Jakarta in het Indonesië. Dit land is in de Gouden Eeuw een kolonie van Nederland. Een bootreis naar Nederlands Indië duurt wel 8 maanden!!! De reis is erg gevaarlijk en het eerste obstakel komt al snel in zicht. ", " Ga nu snel naar de opdracht, want die heeft alles met scheepskamelen te maken!"]
    

    var counter = 1
    
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    @IBAction func swipeLeft(sender: AnyObject) {
        self.performSegueWithIdentifier("naarScheepskameel", sender: nil)
    }

    @IBAction func buttonPressed(sender: AnyObject) {

        self.performSegueWithIdentifier("naarScheepskameel", sender: nil)
        
        /*if counter < 4 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            counter++
            let toImage = UIImage(named:"reis\(counter).jpg")
            if counter < 4 {
                UIView.transitionWithView(self.imageSchreiers,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 4 {
                
                
                
            }
            
        }*/
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "reis1.png")
        labelText.text = textArr[counter - 1]

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    


}
