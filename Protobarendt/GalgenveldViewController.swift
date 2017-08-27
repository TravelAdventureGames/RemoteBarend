//
//  GalgenveldViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 09-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class GalgenveldViewController: UIViewController {

    //var textArr = ["Jullie uitzicht op het IJ ziet er prachtig uit waarschijnlijk, maar denk je eens in. Een paar eeuwen geleden was jullie blik aanmerkelijk minder fraai geweest. Aan de overkant van het IJ was namelijk het galgenveld gelegen, waar misdadigers tentoon werden gesteld, nadat ze op de Dam waren gedood.", "De verminkte lijken hing men op als ‘ter grauwelijck exempel’, totdat ze weggerot waren en werden verorberd door de vogels. De wijk die in Noord is gelegen, de Volewijck is zelfs vernoemd naar deze gevederde lijkenpikkers, zoals je hier ook ziet op de deze schets van Rembrandt", "Jullie krijgen een nieuwe opdracht. Je gaat ouderwets galgje spelen. Probeer het woord te raden en je verdient maximaal 20 florijnen. Per foute letter verlies je 2 punten."]
    
    var textArr = ["Jullie uitzicht op het IJ ziet er prachtig uit, maar denk je eens in. Een paar eeuwen geleden is jullie zicht veel minder mooi. Aan de overkant van het IJ (waar nu filmmuseum EYE ligt) ligt dan namelijk het galgenveld, waar misdadigers tentoon worden gesteld, nadat ze op de Dam waren gedood. Je gaat galgje spelen. Probeer het woord te raden en je verdient maximaal 20 florijnen. Per foute letter verlies je 2 punten."]
    
    
    var counter = 1
    
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    @IBAction func swipeLeft(sender: AnyObject) {
        self.performSegueWithIdentifier("naarGalgje", sender: self)
        
    }
    
    let images = [
        UIImage(named: "galgveld1.jpg")!,
        UIImage(named: "galgveld2.jpg")!,
        UIImage(named: "galgveld3.jpg")!
        
        
        
    ]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("naarGalgje", sender: nil)
        
        /*if counter < 4 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            counter++
            let toImage = UIImage(named:"galgveld\(counter).jpg")
            if counter < 4 {
                UIView.transitionWithView(self.imageSchreiers,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.imageSchreiers.image = toImage },
                    completion: nil)
                labelText.text = textArr[counter - 1]
                
                
            } else if counter == 4 {
                self.performSegueWithIdentifier("naarGalgje", sender: nil)
                
                
            }
            
        }*/
        
       
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageSchreiers.animationImages = images
        imageSchreiers.animationDuration = 9
        imageSchreiers.startAnimating()

        
        labelText.text = textArr[counter - 1]
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
