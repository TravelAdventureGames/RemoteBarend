//
//  UitlegOostindischViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 18-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

var streefscore = 160
var lastScore = 0

class UitlegOostindischViewController: UIViewController {
    
    var counter = 1
    var textArr = ["Barendt heeft wekenlang geleefd als God in Frankrijk in mijn luxueus gemeubileerde kelder, onder het genot van heerlijk grachtenwater en brood met wormen!", "Denk je dat dat allemaal gratis is of zo?Ik geef jullie echter nog een laatste kans, verpruts 'm niet!"]
    var textArr1 = ["Voor kost en inwoning ben ik dus helaas genoodzaakt om wat geld  in rekening te brengen. En dan komen jullie dus precies 1 florijn tekort zoals je ziet.", "Vervul de laatste opdracht en red je armetierige ziel!"]

    @IBAction func swipeLeft(sender: AnyObject) {
        volgendeTapped(self)
    }
    @IBAction func volgendeTapped(sender: AnyObject) {
        counter = counter + 1
        if counter == 2 && score >= streefscore {
            
            self.scoreLabel.text = "Score 159"
            
        }
        
        if score < streefscore && counter < 3 {
            myView.imageView.image = UIImage(named: "grietLeeg.png")
            myView.grietMessLabel.text = "Ik ben echter de beroerdste niet hoor.. Zoals jullie (waarschijnlijk niet) kunnen uitrekenen komen jullie \(streefscore - score) florijnen tekort om Barendt en jezelf te redden."
            myView.grietMessLabel2.text = "Je krijgt nog maar één kans om de resterende florijnen te verdienen. Vervul de laatste opdracht en red je ziel!"
            
           lastScore = score
            messView()
            
    
            //performSegueWithIdentifier("laatsteOpdracht", sender: self)
            
        } else if score >= streefscore && counter < 3 {
            
            myView.grietMessLabel.text = textArr[counter - 2]
            myView.grietMessLabel2.text = textArr1[counter - 2]
            
            lastScore = 199
            
            //score = score - (score - streefscore + 1)
            //scoreLabel.text = "Score \(score)"
            
            messView()
            
        } else if counter == 3 {
            
            performSegueWithIdentifier("laatsteOpdracht", sender: self)
        }

        
    }
    @IBOutlet var scoreLabel: ScoreLabeltje!
    @IBOutlet var myView: aaltjeMessView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        scoreLabel.text = "Score \(score)"
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        myView.hidden = false
        myView.imageView.image = UIImage(named: "grietLeeg.png")
        myView.grietMessLabel.text = "Precies, dus reken maar dat ik mijn mannen aan boord krijg! Ondanks jullie ongelooflijke stupiditeit, hebben jullie toch nog \(score) florijnen bij elkaar gesprokkeld."
        
        if score < streefscore {
            
            myView.grietMessLabel2.text = "Om jullie zielige zieltjes terug te kopen, moesten jullie echter \(streefscore) florijnen verdienen. En dat is dus niet gelukt!"
        } else {
            
            myView.grietMessLabel2.text = "Om jullie zielige zieltjes terug te kopen en Barendt te redden moesten jullie \(streefscore) florijnen verdienen en dat is zo waar ook nog gelukt. Een wonder als je het mij vraagt."
            
        }
        
        messView()
    }
    override func viewWillAppear(animated: Bool) {
        myView.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messView() {
        
        aaltjeMessView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.myView.center = CGPointMake(self.myView.center.x - 400, self.myView.center.y)
                
                let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Griet", withExtension: "mp3")!
                
                do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
                    
                } catch _ {
                    
                    return //if it doesn't exist, don't play it
                }
                bgMusic.numberOfLoops = 0
                bgMusic.prepareToPlay()
                bgMusic.play()
                
            }, completion: nil)

    }
    
    
    
    
}
