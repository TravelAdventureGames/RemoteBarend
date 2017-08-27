//
//  uitlegPaleisViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 30-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

var bgMusic:AVAudioPlayer = AVAudioPlayer()

class uitlegPaleisViewController: UIViewController, AVAudioPlayerDelegate {

    var textArr = ["Je bent op de Dam, de plaats waar Amsterdam in de 13e eeuw is ontstaan. Je kijkt uit op het Damrak, tegenwoordig niet de mooiste straat van Amsterdam, maar vroeger was het Damrak een bijzonder levendige haven waar de schepen aanmeerden om hun handel in en uit te laden.", "Het was dus water toen, maar zoals jullie zien is dat nu niet meer zo. Het Damrak werd vanaf 1845 gedempt.", "Op de foto zie je nog hoe het er vroeger uitzag! Op deze plaats is ook jullie eerste opdracht, dus ga snel verder!"]
    
    
    var counter = 1
    
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        counter++
        if counter < 4 {
            trans()
        } else if counter == 4 {
        self.performSegueWithIdentifier("naarPaleisopdracht", sender: nil)
        }
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        counter++
        
        if counter < 4 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            trans()
                
                
            } else if counter == 4 {
                self.performSegueWithIdentifier("naarPaleisopdracht", sender: nil)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "damrak1.jpg")
        labelText.text = textArr[counter - 1]

    }
    func trans() {
        let toImage = UIImage(named:"damrak\(counter).jpg")
        
        UIView.transitionWithView(self.imageSchreiers,
            duration:1.5,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: { self.imageSchreiers.image = toImage },
            completion: nil)
        labelText.text = textArr[counter - 1]
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
