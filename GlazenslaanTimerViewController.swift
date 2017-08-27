//
//  GlazenslaanTimerViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 08-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class GlazenslaanTimerViewController: UIViewController {

    var buttPushed = false
    var counter = 1
    var timer = NSTimer() //timer nodig voor stopwatch
    var minutes: Int = 0
    var fractions: Int = 0
    var seconds: Int = 0
    var stopWatchString: String = ""
    var timer1 = NSTimer() //timer nodig voor animatie
    var isAnimating = false
    
    @IBOutlet var volgende: UIBarButtonItem!

    @IBOutlet var myView: aaltjeMessView!

    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var stopwatchLabel: UILabel!
    
    @IBOutlet var glassImage: UIImageView!
    


    @IBOutlet var startLabel: UIButton!
    

    @IBAction func swipeLeft(sender: AnyObject) {
        if buttPushed == true {
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    
    @IBAction func startStopButton(sender: AnyObject) {
        
        myView.hidden = true
        glassImage.hidden = false
        startLabel.setTitle("Stop", forState: .Normal)
        
        if isAnimating == false {
            startLabel.layer.cornerRadius = 5
            startLabel.backgroundColor = UIColor(red: 238/255, green: 27/255, blue: 24/255, alpha: 1.0)
            startLabel.setTitle("Stop", forState: .Normal)
            startLabel.titleLabel!.textColor = UIColor.whiteColor()
            
            timer1 = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: "doAnimation", userInfo: nil, repeats: true)
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
        
            
            

            
            isAnimating = true
            //qLabel.hidden = true
            UIView.animateWithDuration(5.0, animations: { () -> Void in
                self.stopwatchLabel.alpha = 0
            })
            
            
            

            
        } else {
            buttPushed = true
            myView.hidden = false
            startLabel.hidden = true
            messView()
            volgende.enabled = true
            timer1.invalidate()
            timer.invalidate()
            isAnimating = false
            startLabel.enabled = false
            
            

            if fractions > 50 {
            seconds = seconds + 1
                
            }
            
            let secondScore = abs(60 - seconds)
            let minusScore = secondScore * 2
            var florijnscore = Int()
            
            if minusScore > 30 {
                florijnscore = 0
            
            } else {
                
                florijnscore = 30 - minusScore
            
            
            }

            
            //qLabel.hidden = false
            
            if florijnscore > 15 {
            
                MyPlayer.playIt("win", ext: "wav")
                myView.grietMessLabel.text = "Volgens mijn berekening zitten jullie afgerond \(secondScore) seconden van de 60 seconden af. Jullie konden 30 florijnen verdienen, maar daar gaat nu dus \(minusScore) florijnen vanaf."
                myView.grietMessLabel2.text = "Jullie mogen daarom \(florijnscore) florijnen bij je spaargeld bijschrijven. Ik heb nog hoop, misschien verdienen jullie toch nog genoeg geld om Barendt vrij te kopen…."
                
                
            } else if florijnscore > 0 {
                MyPlayer.playIt("win", ext: "wav")
                myView.grietMessLabel.text = "Volgens mijn berekening zitten jullie afgerond \(secondScore) seconden van de 60 seconden af. Jullie konden 30 florijnen verdienen, maar daar gaat nu dus \(minusScore) florijnen vanaf."
                myView.grietMessLabel2.text = "Jullie mogen daarom \(florijnscore) florijnen bij je spaargeld bijschrijven. Ik had op iets meer gehoopt.. Bar weinig florijnen"
                
                
            } else {
                MyPlayer.playIt("error", ext: "wav")
                myView.grietMessLabel.text = "Volgens mijn berekening zitten jullie afgerond \(secondScore) seconden van de 60 seconden af. Jullie konden 30 florijnen verdienen, maar daar gaat nu dus \(minusScore) florijnen vanaf."
                myView.grietMessLabel2.text = "Helaas niet zo goed gedaan als ik had gehoopt... Jullie verdienen met deze opdracht precies nul komma nul florijnen."
                
            }
            
            glassImage.hidden = true
            self.stopwatchLabel.alpha = 1
            score = score + florijnscore
            scoreLabel.text = " Score \(score)"

            

            
        }
        

    
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.hidden = true
        glassImage.hidden = true
        scoreLabel.text = " Score \(score)"
        startLabel.setTitle("Start", forState: .Normal)
        startLabel.layer.cornerRadius = 5
        stopwatchLabel.alpha = 1
        glassImage.image = UIImage(named: "hourglassnew1.png")
        scoreLabel.layer.cornerRadius = 3
        volgende.enabled = false
        startLabel.setTitle("Start", forState: .Normal)
      
    }
    override func viewDidAppear(animated: Bool) {
        myView.hidden = false
        myView.grietMessLabel.text = "Ik ben benieuwd hoe goed jullie gevoel voor tijd eigenlijk is. De moeilijkheid is dat je je moderne smartphone niet mag gebruiken om de tijd op te nemen."
        myView.grietMessLabel2.text = "Tel in je hoofd (of hardop) en stop precies op 60 seconden!! Je kunt maar liefst 30 florijnen verdienen, maar per seconde verschil verlies je 2 florijnen.."
        messView()
    }
    

    
    func updateStopwatch() {
        fractions += 1
        if fractions == 100 {
            
            seconds += 1
            fractions = 0
            
        

        }
        
        let fractionString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        
            
        stopWatchString = "\(secondString):\(fractionString)"
        stopwatchLabel.text = stopWatchString
        

        
        
    }
    
    func doAnimation() {
        
        if counter == 8 {
            
            counter = 1
        } else {
            
            counter++
        }
        
        glassImage.image = UIImage(named: "hourglassnew\(counter)")
    }
    func messView() {
        
        grietMessView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.myView.center = CGPointMake(self.myView.center.x - 400, self.myView.center.y)
                
                MyPlayer.playIt("Aaltje", ext: "mp3")
                
            }, completion: nil)
        
    }
    func messView1() {
        
        grietMessView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.myView.center = CGPointMake(self.myView.center.x - 400, self.myView.center.y)
                
                MyPlayer.playIt("error", ext: "wav")
                
            }, completion: nil)
        
    }
    func messView3() {
        
        grietMessView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.myView.center = CGPointMake(self.myView.center.x - 400, self.myView.center.y)
                
                MyPlayer.playIt("win", ext: "wav")
                
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
