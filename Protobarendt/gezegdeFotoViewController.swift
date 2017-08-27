//
//  gezegdeFotoViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 12-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

var gekozenGezegde = String()

class gezegdeFotoViewController: UIViewController {
    var FotoGegeven1 = UIImage()
    
    @IBOutlet var whatsappImage: UIImageView!
    @IBOutlet var gezegdeFoto: UIImageView!
    @IBOutlet var gezegdeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        score = score + 3
        scoreLabel.text = "Score \(score)"
        gezegdeLabel.text = gekozenGezegde
        gezegdeFoto.image = FotoGegeven1
        //tekstLabel.text = "Jullie hebben het spreekwoord '\(gekozenGezegde)'heel goed uitgebeeld, complimenten! 5 dikverdiende florijnen gaan jullie kant op! Ga vlug naar de volgende locatie."

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {

            case UISwipeGestureRecognizerDirection.Left:
                self.performSegueWithIdentifier("toNext", sender: self)
            default:
                break
            }
        }
    }

    func whatsMessage() {
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
            MyPlayer.playIt("Griet", ext: "mp3")
                
            }, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "amsterdam2.png")
        
        whatsMessage()
        
    }


}
