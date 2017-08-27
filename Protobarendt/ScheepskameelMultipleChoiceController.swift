//
//  ScheepskameelMultipleChoiceController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 07-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

var audioPLayer = AVAudioPlayer()

class ScheepskameelMultipleChoiceController: UIViewController {

    var ansGiv = false

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var eersteButton: UIButton!
    @IBOutlet var tweedeButton: UIButton!
    @IBOutlet var derdeButton: UIButton!
    @IBOutlet var vierdeButton: UIButton!
    @IBOutlet var answerThree: UIButton!
    @IBOutlet var scheepsImage: UIImageView!
    @IBOutlet var whatsappImage: UIImageView!
    @IBAction func answerOne(sender: AnyObject) {
        

        //AnswerLabel.text = "Echt super, jullie zijn echt hyperintelligent! Jullie krijgen 25 verdiende florijnen. We liggen op koers!"
        ansGiv = true
        whatsappImage.image = UIImage(named: "barendtkameel2.png")
        whatsMessage("win", ext: "wav")
        

        eersteButton.hidden = true
        tweedeButton.hidden = true
        derdeButton.hidden = true
        vierdeButton.hidden = true
        scheepsImage.hidden = false
        scheepsImage.image = UIImage(named: "scheepskameel1.png")
        
        score = score + 25
        scoreLabel.text = "score \(score)"



    }
    
    @IBAction func answerTwo(sender: AnyObject) {
        

        //AnswerLabel.text = "Oh nee.. Jullie sloegen de plank mis! Per kameel moet een inhoud van 1,5m x 5m x 50m = 375 m3 worden weggepompt. Voor twee kamelen is dat dus 750 kubieke meter water. Een m3 is 1000 liter dus in totaal is dat 750.000 liter."
        ansGiv = true
        whatsappImage.image = UIImage(named: "barendtkameel3.png")
        whatsMessage("error", ext: "wav")
        
        eersteButton.hidden = true
        tweedeButton.hidden = true
        derdeButton.hidden = true
        vierdeButton.hidden = true
        scheepsImage.hidden = false
        scheepsImage.image = UIImage(named: "scheepskameel1.png")

        
        scoreLabel.text = "score \(score)"

        
    }
    
    
    @IBAction func answerThree(sender: AnyObject) {

        //AnswerLabel.text = "Oh nee.. Jullie sloegen de plank mis! Per kameel moet een inhoud van 1,5m x 5m x 50m = 375 m3 worden weggepompt. Voor twee kamelen is dat dus 750 kubieke meter water. Een m3 is 1000 liter dus in totaal is dat 750.000 liter."
        ansGiv = true
        whatsappImage.image = UIImage(named: "barendtkameel3.png")
        whatsMessage("error", ext: "wav")
        
        eersteButton.hidden = true
        tweedeButton.hidden = true
        derdeButton.hidden = true
        vierdeButton.hidden = true
        scheepsImage.hidden = false
        scheepsImage.image = UIImage(named: "scheepskameel1.png")

        
        scoreLabel.text = "score \(score)"

    }
    
    @IBAction func answerFour(sender: AnyObject) {
        

        //AnswerLabel.text = "Oh nee.. Jullie sloegen de plank mis! Per kameel moet een inhoud van 1,5m x 5m x 50m = 375 m3 worden weggepompt. Voor twee kamelen is dat dus 750 kubieke meter water. Een m3 is 1000 liter dus in totaal is dat 750.000 liter."
        ansGiv = true
        whatsappImage.image = UIImage(named: "barendtkameel3.png")
        whatsMessage("error", ext: "wav")
        
        eersteButton.hidden = true
        tweedeButton.hidden = true
        derdeButton.hidden = true
        vierdeButton.hidden = true
        scheepsImage.hidden = false
        scheepsImage.image = UIImage(named: "scheepskameel1.png")
        
        scoreLabel.text = "score \(score)"

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            //questionLabel.text = "Zie de scheepskamelen als twee balken aan weerszijden van het schip met een afmeting van 50 x 5 x 5 meter. Om De Gouden Buis hoog genoeg op te tillen moet het waterpeil in de kamelen 1,5 meter dalen. Hoeveel liter water moet er in totaal uit de twee scheepskamelen worden gepompt om dat te bereiken? Je kunt 25 punten verdienen en mag de calculator op je smartphone gebruiken!"
        

        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        scoreLabel.text = "score \(score)"
        scheepsImage.hidden = true
        
        

        // Do any additional setup after loading the view.
    }
    
    func whatsMessage(name: String, ext: String) {
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt(name, ext: ext)
                
            }, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "barendtkameel1.png")
        
        whatsMessage("Barendt", ext: "mp3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                performSegueWithIdentifier("toFormer", sender: self)
            case UISwipeGestureRecognizerDirection.Left:
                if ansGiv == true {
                performSegueWithIdentifier("toNext", sender: self)
                }
            default:
                break
            }
        }
    }



}
