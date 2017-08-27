//
//  PuntenAepjenViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 06-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

var teamNaamGegeven = String()


class PuntenAepjenViewController: UIViewController {

    var FotoGegeven = UIImage()
    @IBOutlet var teamFoto: UIImageView!
    @IBOutlet var teamNaam: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var whatsappImage: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        score = score + 3
        scoreLabel.text = "Score \(score)"
        
        //labelText.text = "Gefeliciteerd! Jullie hebben je ziel verkocht voor 3 hele florijnen!"


        teamNaam.text = "\(teamNaamGegeven)"
        teamFoto.image = FotoGegeven
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true
        teampje = FotoGegeven
        
    }
    
    override func viewDidAppear(animated: Bool) {

        whatsappImage.image = UIImage(named: "grietMessage.png")
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("Griet", ext: "mp3")
                
            }, completion: nil)
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                performSegueWithIdentifier("toNext", sender: self)
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
