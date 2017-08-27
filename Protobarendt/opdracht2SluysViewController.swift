//
//  opdracht2SluysViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 26-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class opdracht2SluysViewController: UIViewController {
    @IBOutlet var volgende: UIBarButtonItem!
    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var whatsappImage: UIImageView!
    @IBOutlet var bu1: UIButton!
    @IBOutlet var bu2: UIButton!
    @IBOutlet var bu3: UIButton!
    
    var ansGiven = false
    
    @IBAction func swipeLeft(sender: AnyObject) {
        if ansGiven == true {
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    @IBAction func button1(sender: AnyObject) {
        ansGiven = true
        score = score + 5
        scoreLabel.text = " Score \(score)"
        whatsMessage("vraag21", audio: "win", ext: "wav")
        volgende.enabled = true
        //vraagLabel2.hidden = true
        bu1.enabled = false
        bu2.enabled = false
        bu3.enabled = false
    }
    @IBAction func button2(sender: AnyObject) {
        ansGiven = true
        whatsMessage("vraag22", audio: "error", ext: "wav")
        volgende.enabled = true
        //vraagLabel2.hidden = true
        bu1.enabled = false
        bu2.enabled = false
        bu3.enabled = false
        
    }
    
    @IBAction func button3(sender: AnyObject) {
        ansGiven = true
        whatsMessage("vraag23", audio: "error", ext: "wav")
        volgende.enabled = true
        //vraagLabel2.hidden = true
        bu1.enabled = false
        bu2.enabled = false
        bu3.enabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volgende.enabled = false
        scoreLabel.text = " Score \(score)"
        
        
        bu1.layer.cornerRadius = 5
        bu1.layer.borderWidth = 0.4
        bu1.layer.borderColor = UIColor.grayColor().CGColor
        
        bu2.layer.cornerRadius = 5
        bu2.layer.borderWidth = 0.4
        bu2.layer.borderColor = UIColor.grayColor().CGColor
        
        bu3.layer.cornerRadius = 5
        bu3.layer.borderWidth = 0.4
        bu3.layer.borderColor = UIColor.grayColor().CGColor
        
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true
    }
    override func viewDidAppear(animated: Bool) {
        whatsMessage("vraag2.png", audio: "Barendt", ext: "mp3")
        
    }
    func whatsMessage(name: String, audio: String, ext: String) {
        whatsappImage.image = UIImage(named: name)
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt(audio, ext: ext)
                
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
