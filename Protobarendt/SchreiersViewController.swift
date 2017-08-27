//
//  SchreiersViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 07-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class SchreiersViewController: UIViewController {
    
    
    var textArr = ["Hier zie je de Schreierstoren door de ogen van schilder Willem Koekoek. Zoals je ziet ligt de toren nog direct aan het water van het IJ. Het station is er nog helemaal niet. Huilende vrouwen zwaaien hier hun mannen uit voordat ze de zee opgaan.", "waar het een komen en gaan van schepen was.", "Amsterdam was toen natuurlijk veel en veel kleiner dan nu; er woonden in de Gouden Eeuw zo'n 200 duizend mensen. Buiten wat we nu 'centrum' noemen, was alleen maar weiland.", "Amsterdam was toen, samen met Antwerpen één van de belangrijkste havens van de wereld!"]
    
    
    var counter = 1
    
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toChirurgijn", sender: nil)
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toChirurgijn", sender: nil)
        
        /*if counter < 5 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            counter++
            let toImage = UIImage(named:"schreiers\(counter).jpg")
            if counter < 5 {
                UIView.transitionWithView(self.imageSchreiers,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 5 {
                
                self.performSegueWithIdentifier("toChirurgijn", sender: nil)
                
            }
            
        }*/
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "schreiers1.png")
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
